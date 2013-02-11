module Taskman
  class TaskValidator
    include ActiveModel::Model
    def checksum
      @checksum ||= paramlist.hash
    end
    def duplicate?
      return false  unless TaskServer.has_tasks_with_checksum?(checksum)
      TaskServer.tasks_with_same_content(self)
    end
  end
end