module SessionsHelper

  # ログイン中のユーザーを取得するメソッド
  def current_user
    # 左が真の場合はそのまま、偽の場合は右の処理が実行される。
  @current_user ||= User.find_by(id: session[:user_id])
end

# ユーザーがログインしていればtrue、その他ならfalseを返すメソッド
  def logged_in?
    current_user.present?
  end
end
