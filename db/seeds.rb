table_names = %w(movies theaters schedules screens members)
table_names.each do |table_name|
    path = Rails.root.join("db/seeds",Rails.env,table_name + ".rb")
    if File.exist?(path)
        puts "作成中 #{table_name}..."
        require path
    end
end