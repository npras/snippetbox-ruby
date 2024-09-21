require 'sequel'

module SnippetBox::Models
  class Snippet

    def initialize db
      @dataset = db[:snippets]
    end

    def insert title, content, expires_at
      utc_now = DateTime.now.new_offset 0
      utc_expiring_at = utc_now.next_day expires_at
      returned = @dataset.returning(:id).insert(title: title,
                                                content: content,
                                                created_at: utc_now,
                                                expires_at: utc_expiring_at)
      returned.dig 0, :id
    end

    def get id
    end

    def latest
    end

  end
end
