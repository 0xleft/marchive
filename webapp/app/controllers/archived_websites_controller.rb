class ArchivedWebsitesController < ApplicationController
  def index
    @last_archived_websites = ArchivedWebsite.limit(10).order(created_at: :desc)
  end

  def search
    @search = params[:url]
    @archived_websites = ArchivedWebsite.where('url LIKE ?', "%#{@search}%").limit(10)
  end

  def create
    url = params[:url]
    content = "test"
    archived_website = ArchivedWebsite.new(url: url, content: content, archived: Date.today)
    archived_website.save

    redirect_to root_path
  end
end
