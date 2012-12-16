class Bookmarks.Models.Bookmark extends Backbone.Model
  paramRoot: 'bookmark'

  defaults:
    url: null

class Bookmarks.Collections.BookmarksCollection extends Backbone.Collection
  model: Bookmarks.Models.Bookmark
  url: '/bookmarks'
