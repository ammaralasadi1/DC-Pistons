Article.destroy_all
Comment.destroy_all

art_one = Article.create(title: "petrol", body: "Loremhhhhdhdhsdahadhasdhasdhdhsadsadsadsad", author_name: "Alex Mandels", photo_url: "https://goo.gl/uDZhbj")
comment = Comment.create(body:"Hi", author_name: "yes", article_id: 1)
