image_list = ["AM.jpg", "BS.jpg", "Dotes.jpg", "Dotes2.jpg", "Invoker.jpg", "OD.jpg", "SF.jpg", "Silencer.jpg", "Slark.jpg", "Spectre.jpg", "Ursa.jpg", "BH.jpg", "DK.jpg", "Tide.jpg", "WR.jpg", "Nyx.jpg", "PA.jpg", "SB.jpg", "Clock.jpg", "Jugg.jpg", "SS.jpg"]

image_list.each do |image|
 Post.create({ title: Faker::Name.title,
                 body: Faker::RickAndMorty.quote,
                 body_full: Faker::Hipster.paragraph(50),
                 likes: rand(500),
                 image: image
                 })
end
