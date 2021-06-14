json.tasks do
  json.array! @tasks do |folder|
    json.extract! folder, :id, :title, :details, :completed
    end
end
