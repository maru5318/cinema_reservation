module ApplicationHelper
    def menu_link_to(text,path,options = {})
        content_tag:li do
            condition = options[:method] || !current_page?(path)#引数に指定されたURLパスと現在のページのURLパスが一っ値するかどうか調べている。
            link_to_if(condition,text,path,options)do
                content_tag(:span,text)
            end
        end
        #削除リンクのリンク先URLが現在と同じページのURLの場合リンクにならないので、methodオプションが設定されている場合は、
        #常にリンク化するように変更された.(chapter 10.3)
    end
    def page_title
        title = "Cinemasite"
        title = @page_title + "-" + title if @page_title
        title
    end
end
