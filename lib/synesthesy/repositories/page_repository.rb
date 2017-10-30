class PageRepository < Hanami::Repository
  def get_by_slug(slug)
    pages
      .where(slug: slug)
      .limit(1)
      .first
  end
end
