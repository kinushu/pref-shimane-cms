require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Susanoo::Admin::PageTemplatesController do
  describe "フィルタ" do
    controller do
      %w(index new create edit update destroy).each do |act|
        define_method(act) do
          render text: "ok"
        end
      end
    end

    before do
      @routes.draw do
        resources :anonymous do
        end
      end
    end

    describe "admin_required" do
      shared_examples_for "未ログイン時のアクセス制限" do |met, act|
        it "#{met.upcase} #{act}にアクセスしたとき、ログイン画面が表示されること" do
          expect(response).to redirect_to(login_susanoo_users_path)
        end
      end

      shared_examples_for "運用管理者ログイン時のアクセス制限"  do |met, act|
        before{@user = login(create(:user))}
        it "#{met.upcase} #{act}にアクセスしたとき、okが返ること" do
          (response.body == "ok").should be_true
        end
      end

      shared_examples_for "情報提供責任者ログイン時のアクセス制限"  do |met, act|
        before{@user = login(create(:section_user))}
        it "#{met.upcase} #{act}にアクセスしたとき、トップページへリダイレクトされること" do
          expect(response).to redirect_to(susanoo_dashboards_path)
        end
      end

      shared_examples_for "一般ユーザログイン時のアクセス制限" do |met, act|
        before{@user = login(create(:normal_user))}
        it "#{met.upcase} #{act}にアクセスしたとき、トップページへリダイレクトされること" do
          expect(response).to redirect_to(susanoo_dashboards_path)
        end
      end

      before do
        # 他のフィルタを停止
        controller.stub(:set_page_template).and_return(true)
        @page_template = create(:page_template)
      end

      context "未ログイン状態" do
        it_behaves_like("未ログイン時のアクセス制限", :get, :index)      {before{get :index}}
        it_behaves_like("未ログイン時のアクセス制限", :get, :new)        {before{get :new}}
        it_behaves_like("未ログイン時のアクセス制限", :post, :create)    {before{post :create}}
        it_behaves_like("未ログイン時のアクセス制限", :get, :edit)       {before{get :edit, id: @page_template.id}}
        it_behaves_like("未ログイン時のアクセス制限", :patch, :update)   {before{patch :update, id: @page_template.id}}
        it_behaves_like("未ログイン時のアクセス制限", :delete, :destroy) {before{delete :destroy, id: @page_template.id}}
      end

      context "ログイン状態" do
        context "運用管理者の場合" do
          it_behaves_like("運用管理者ログイン時のアクセス制限", :get, :index)         {before{get :index}}
          it_behaves_like("運用管理者ログイン時のアクセス制限", :get, :new)           {before{get :new}}
          it_behaves_like("運用管理者ログイン時のアクセス制限", :post, :create)       {before{post :create}}
          it_behaves_like("運用管理者ログイン時のアクセス制限", :get, :edit)          {before{get :edit, id: @page_template.id}}
          it_behaves_like("運用管理者ログイン時のアクセス制限", :patch, :update)      {before{patch :update, id: @page_template.id}}
          it_behaves_like("運用管理者ログイン時のアクセス制限", :delete, :destroy)    {before{delete :destroy, id: @page_template.id}}
        end

        context "情報提供責任者の場合" do
          it_behaves_like("情報提供責任者ログイン時のアクセス制限", :get, :index)     {before{get :index}}
          it_behaves_like("情報提供責任者ログイン時のアクセス制限", :get, :new)       {before{get :new}}
          it_behaves_like("情報提供責任者ログイン時のアクセス制限", :post, :create)   {before{post :create}}
          it_behaves_like("情報提供責任者ログイン時のアクセス制限", :get, :edit)      {before{get :edit, id: @page_template.id}}
          it_behaves_like("情報提供責任者ログイン時のアクセス制限", :patch, :update)  {before{patch :update, id: @page_template.id}}
          it_behaves_like("情報提供責任者ログイン時のアクセス制限", :delete, :destroy){before{delete :destroy, id: @page_template.id}}
        end

        context "一般ユーザの場合" do
          it_behaves_like("一般ユーザログイン時のアクセス制限", :get, :index)         {before{get :index}}
          it_behaves_like("一般ユーザログイン時のアクセス制限", :get, :new)           {before{get :new}}
          it_behaves_like("一般ユーザログイン時のアクセス制限", :post, :create)       {before{post :create}}
          it_behaves_like("一般ユーザログイン時のアクセス制限", :get, :edit)          {before{get :edit, id: @page_template.id}}
          it_behaves_like("一般ユーザログイン時のアクセス制限", :patch, :update)      {before{patch :update, id: @page_template.id}}
          it_behaves_like("一般ユーザログイン時のアクセス制限", :delete, :destroy)    {before{delete :destroy, id: @page_template.id}}
        end
      end
    end

    describe "set_page_template" do
      before do
        # 他のフィルタを停止
        controller.stub(:admin_required).and_return(true)
        @page_template = create(:page_template)
      end

      shared_examples_for "インスタンス変数@page_templateが正しく設定されているかの検証" do
        it "インスタンス変数@page_templateのidがパラメータ:idで送った値と等しいこと" do
          expect(assigns[:page_template]).to eq(@page_template)
        end
      end

      context "GET editにアクセスしたとき" do
        before do
          get :edit, id: @page_template.id
        end
        it_behaves_like "インスタンス変数@page_templateが正しく設定されているかの検証"
      end

      context "PATCH updateにアクセスしたとき" do
        before do
          patch :update, id: @page_template.id
        end
        it_behaves_like "インスタンス変数@page_templateが正しく設定されているかの検証"
      end

      context "DELETE destroyにアクセスしたとき" do
        before do
          delete :destroy, id: @page_template.id
        end
        it_behaves_like "インスタンス変数@page_templateが正しく設定されているかの検証"
      end
    end
  end

  describe "アクション" do
    before do
      login(create(:user))

      @page_templates = create_list(:page_template, 3)
      @page_template = @page_templates.first
    end

    describe "GET index" do
      describe "正常系" do
        subject { get :index }

        it "テンプレートindexを表示できること" do
          expect(subject).to render_template('index')
        end

        it "page_templateseオブジェクトが取得できていること" do
          subject
          expect(assigns[:page_templates]).to eq(@page_templates)
        end
      end
    end

    describe "GET new" do
      describe "正常系" do
        subject { get :new }

        it "テンプレートindexを表示できること" do
          expect(subject).to render_template('new')
        end

        it "新しいUserインスタンスを作成していること" do
          subject
          expect(assigns(:page_template).new_record?).to be_true
        end
      end
    end


    describe "POST create" do
      subject { post :create, { page_template: {name: 'new_template', content: "<h1>NEW</h1>"}} }

      describe "正常系" do
        it "コンテンツ編集画面へリダイレクトすること" do
          expect(subject).to redirect_to(edit_content_susanoo_admin_page_template_path(assigns[:page_template]))
        end

        it "PageTemplateを新規作成していること" do
          expect{subject}.to change {PageTemplate.count}.by(1)
        end

        it "成功メッセージが表示されること" do
          subject
          expect(flash[:notice]).to eq(
            I18n.t("susanoo.admin.page_templates.create.success",
              name: "new_template")
          )
        end

      end

      describe "異常系" do
        context "バリデーションに失敗した場合" do
          subject { post :create, {page_template: {name: '', content: "<h1>NEW</h1>"}} }

          it "作成画面を再描画していること" do
            expect(subject).to render_template(:new)
          end

          it "PageTemplateを新規作成していないこと" do
            expect{subject}.to change {PageTemplate.count}.by(0)
          end
        end
      end
    end

    describe "GET edit" do
      subject { get :edit, id: @page_template.id }

      describe "正常系" do
        it "テンプレートeditを表示できること" do
          expect(subject).to render_template('edit')
        end
      end
    end

    describe "GET show" do
      subject { get :show, id: @page_template.id }

      describe "正常系" do
        it "テンプレートshowを表示できること" do
          expect(subject).to render_template('show')
        end
      end
    end

    describe "PATCH update" do
      subject { patch :update, { id: @page_template.id, page_template: {name: 'edit'} } }

      describe "正常系" do
        it "コンテンツ編集画面へリダイレクトすること" do
          expect(subject).to redirect_to(edit_content_susanoo_admin_page_template_path(assigns[:page_template]))
        end

        it "テンプレートが変更されていること" do
          subject
          expect(@page_template.reload.name).to eq('edit')
        end

        it "成功メッセージが表示されること" do
          subject
          expect(flash[:notice]).to eq(
            I18n.t("susanoo.admin.page_templates.update.success",
              name: "edit")
          )
        end
      end

      describe "異常系" do
        context "バリデーションに失敗した場合" do
          subject { patch :update, {id: @page_template.id, page_template: {name: nil}} }

          it "作成画面を再描画していること" do
            expect(subject).to render_template(:edit)
          end

          it "テンプレートが変更されていないこと" do
            subject
            expect(PageTemplate.find(@page_template.id)).to eq(@page_template)
          end
        end
      end
    end

    describe "delete destroy" do
      describe "正常系" do
        subject { delete :destroy, id: @page_template.id }

        it "PageTemplateの数が減っていること" do
          expect{subject}.to change {PageTemplate.count}.by(-1)
        end

        it "一覧画面へリダイレクトすること" do
          expect(subject).to redirect_to(susanoo_admin_page_templates_path)
        end

        it "成功メッセージが表示されること" do
          subject
          expect(flash[:notice]).to eq(
            I18n.t("susanoo.admin.page_templates.destroy.success",
              name: @page_template.name)
          )
        end
      end
    end
  end
end
