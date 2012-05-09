atom_feed do |feed|
  feed.title("#{@commentable.try(:title)} Comment Feed")
  feed.updated(@comments.first.created_at) if @comments.any?

  @comments.each do |root_comment|
    root_comment.subtree.each do |comment|
      feed.entry(@commentable) do |entry|
        entry.title(truncate(comment.body))
        entry.content(comment.body, :type => 'text')

        entry.author do |author|
          author.name
        end
      end
    end
  end
end