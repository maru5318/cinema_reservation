class ApplicationController < ActionController::Base
    private def current_member
        Member.find_by(id: cookies[:member_id]) if cookies[:member_id]
    end
    helper_method :current_member

    private def current_admin
        Admin.find_by(id: cookies[:admin_id]) if cookies[:admin_id]
    end
    helper_method :current_admin
    
    class LoginRequired < StandardError;end
    class Forbidden < StandardError;end
    #StandardErrorクラスを継承してLoginRequiredクラスとForbiddenクラスを定義

    # if Rails.env.production? || ENV["RESCUE_EXCEPTIONS"]#救援_例外
#     rescue_from StandardError,with: :rescue_internal_server_error
#     rescue_from ActiveRecord::RecordNotFound,with: :rescue_not_found
#     rescue_from ActionController::ParameterMissing,with: :rescue_bad_request
#     # end
# #rescue_fromの第一引数は、例外のクラスを指定する。withオプションには例外が発生した時に実行するメソッドの名前を指定する。
#     rescue_from LoginRequired,with: :rescue_login_required
#     rescue_from Forbidden,with: :rescue_forbidden
    private def login_required
        raise LoginRequired unless current_member
        #例外を発生させている。raise
    end
    private def rescue_bad_request(exception)
        render "errors/bad_request",status: 400,layout: "error",
        formats: [:html]
        #
    end
    private def rescue_login_required(exception)
        render "errors/login_required",status: 403,layout: "error",
        formats: [:html]
    end
    private def rescue_forbidden(exception)
        render "errors/forbidden",status: 403,layout: "error",
        formats: [:html]
    end
    private def rescue_not_found(exception)
        render "errors/not_found",status: 404,layout: "error",
        formats: [:html]
    end
    private def rescue_internal_server_error(exception)
        render "errors/internal_server_error",status: 500,layout: "error",
        formats: [:html]
    end
    # 400 bad request リクエストの構文、形式、内容が正しくない
    # 403 forbidden リソースへのアクセス権限がない
    # 404 not found リソースが存在しない
    # 500 internal server error アプリケーションでエラーが発生した
end
