module SnippetBox::Models
  class Snippet

    def initialize db
      @db = db[:snippets]
    end

    def insert title:, content:, expires_at:
      utc_expiring_at = utc_now.next_day expires_at
      returned = @db.returning(:id).insert(title:,
                                           content:,
                                           created_at: utc_now,
                                           expires_at: utc_expiring_at)
      returned.dig 0, :id
    end

    def get id
      @db.where(id:).where{ _1.expires_at > utc_now }.first
    end

    def latest
      @db.where{ _1.expires_at > utc_now }.reverse_order(:id).limit(10).all
    end

    private def utc_now = DateTime.now.new_offset(0)

  end
end
