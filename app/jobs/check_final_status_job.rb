class CheckFinalStatusJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # check status, update DB and gies to step 2 
  end
end
