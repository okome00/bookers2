class ApplicationController < ActionController::Base
  # ログインしていない状態でtopページ以外にアクセスした場合は、ログイン画面へリダイレクトする
  before_action :authenticate_user!, except: [:top, :about]

  # devise機能を実行する前に、configure_permitted_parametersメソッドを実行させる
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Log_in後の遷移先設定
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  # Log_out後の遷移先設定
  def after_sign_out_path_for(resource)
    root_path
  end
  protected

  # emailデータの保存を許可する設定（ストロングパラメータ）
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
