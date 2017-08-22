# -*- SkipSchemaAnnotations
class AmazonProductAPI
  def initialize
    @client = Rapa::Client.new(
      access_key_id: ENV["AMAZON_ACCESS_KEY_ID"],
      secret_access_key: ENV["AMAZON_SECRET_ACCESS_KEY"],
      associate_tag: ENV["AMAZON_ASSOCIATE_TAG"],
    )
  end

  def search(isbn)
    @client.list_items(
      domain: "co.jp",
      id_type: "ISBN",
      search_index: "Books",
      item_ids: [isbn],
      response_groups: [
        "BrowseNodes",
        "Images",
        "ItemAttributes",
      ],
    )
  end
end
