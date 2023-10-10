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
    if URI.parse(url).scheme.nil?
      url = "http://#{url}"
    end
    begin
      content = HTTParty.get(url, headers: { 'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0' }).body
    rescue
      redirect_to root_path
      return
    end

    archived_website = ArchivedWebsite.new(url: url, content: content, archived: Date.today)
    archived_website.save

    redirect_to archive_path(date: archived_website.archived, url: archived_website.url)
  end

  def archive
    date = params[:date]
    url = params[:url]

    archived_website = ArchivedWebsite.where(url: url, archived: date).first
    if archived_website
      @content = archived_website.content
    else
      @content = "No content found"
    end

    @date = date
    @url = url
  end
end
