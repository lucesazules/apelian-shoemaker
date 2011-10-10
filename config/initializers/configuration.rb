begin
  if AppConfig.count == 0
    AppConfig.create
  end
rescue
end
