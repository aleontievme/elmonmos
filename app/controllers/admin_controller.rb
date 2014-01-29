class AdminController < ApplicationController
  # GET: /admin/update
  # Fetchh and process all the content
  def update
    AdminLogics.update(Settings.git_path)
  end
end
