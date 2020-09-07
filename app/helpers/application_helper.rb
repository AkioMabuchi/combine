module ApplicationHelper
  def default_meta_tags
    {
        site: "Combine",
        title: "互いに無関係な2つを組み合わせよう",
        reverse: true,
        charset: "utf-8",
        description: "『Combine』は互いに無関係な2つを組み合わせて何かを作るサービスです、アイデアの源泉および大喜利に活用してください",
        keywords: [
            "組み合わせ",
            "大喜利"
        ],
        canonical: request.original_url,
        separator: "|",
        icon:[
            {
                href: image_url("favicon.ico")
            },
            {
                href: image_url("Icon.png"),
                rel: "apple-touch-icon",
                sizes: "180x180",
                type: "image/png"
            }
        ],
        og:{
            site_name: "Combine",
            title: "互いに無関係な2つを組み合わせよう",
            description: "『Combine』は互いに無関係な2つを組み合わせて何かを作るサービスです",
            type: "website",
            url: request.original_url,
            image: image_url("Icon.png"),
            locale: "ja-JP"
        },
        twitter:{
            card: "summary",
            site: "@AkioMabuchi"
        },
        viewport: "width=device-width, initial-scale=0.9"
    }
  end
end
