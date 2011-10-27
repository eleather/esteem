module ApplicationHelper
  def title(text)
    content_for(:title) { text }
  end

  def minify(filename)
    Rails.env.development? ? filename : "#{filename}.min"
  end
end
