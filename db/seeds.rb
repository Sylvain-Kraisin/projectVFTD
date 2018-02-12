unless Rails.env.production?
  User.create(username: "Papako", email: "sylvain.kraisin@gmail.com", password: "password", password_confirmation: "password", role:"admin")

  console = Console.create(title: "Console 1")

  Video.create(
    title: "Video 1",
    console_id: console.id,
    link: "https://www.youtube.com/watch?v=BRXWosbxJm4&t=1s",
    style: "nes",
    release: "1989-04-28",
    genre: "Plates-formes",
    player: "1",
    developer: "Nintendo",
    video_img: "http://s1.lemde.fr/mmpub/edt/zip/2016/01/22/144523341-f12ece18c16623cacddc3a707be10aa6676b4393/assets/images/content/rabesandratana.jpg",
    aasm_state: "online"
  )

  category = Category.create(name: "Categorie 1")

  Post.create!(
    :title => "Post 1",
    :content => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vitae dignissim ante, egestas fringilla augue. Suspendisse in feugiat dolor, at pellentesque ipsum. Nulla efficitur justo ipsum. Curabitur at consectetur tortor, in sollicitudin diam. Donec non facilisis metus. Proin vitae ultricies ante. Vestibulum porta sem quis blandit malesuada. Vestibulum interdum imperdiet elit sit amet posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere     cubilia Curae; Donec iaculis fringilla tempor. Phasellus iaculis sem quis sem aliquet ultrices. Pellentesque et ante orci. Nullam auctor id lacus quis ullamcorper.

      Suspendisse nec nisi vulputate, auctor est vitae, cursus odio. Morbi maximus mattis nunc in luctus. Etiam purus augue, pharetra eu elit at, interdum varius velit. Quisque scelerisque elit nec tortor tempor sollicitudin. Mauris varius ultricies justo a sollicitudin. Mauris lacus nibh, faucibus in ligula nec, accumsan sollicitudin ex. Nam ac mi erat. Mauris dignissim, leo non molestie laoreet, tellus nulla egestas ex, sit amet egestas orci enim in nulla. Suspendisse at maximus ipsum, nec varius dui. Suspendisse hendrerit dolor non neque elementum, id laoreet risus consequat. Integer suscipit tortor vitae lorem bibendum mattis.

      Integer dapibus nec libero a iaculis. Pellentesque laoreet, felis ac luctus convallis, nisi nulla iaculis sapien, a tempus lacus tellus id neque. Sed dui massa, porta ac enim non, sollicitudin condimentum purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In imperdiet tellus ac aliquam sodales. Maecenas diam orci, bibendum ullamcorper imperdiet ut, vestibulum et elit. Sed cursus faucibus est, nec efficitur dolor. Nam pellentesque leo aliquam nisl commodo, ut volutpat nulla imperdiet. Suspendisse potenti. Cras porttitor eget elit vel feugiat. Cras lacinia euismod enim sit amet commodo. Proin faucibus felis a convallis iaculis. Donec eget suscipit ex, semper massa nunc.",
    :author => "Papako",
    :category_id => category.id,
    post_img: "http://s1.lemde.fr/mmpub/edt/zip/2016/01/22/144523341-f12ece18c16623cacddc3a707be10aa6676b4393/assets/images/content/rabesandratana.jpg",
    :image => "http://s1.lemde.fr/mmpub/edt/zip/2016/01/22/144523341-f12ece18c16623cacddc3a707be10aa6676b4393/assets/images/content/rabesandratana.jpg",
    :aasm_state => "published"
  )
end
