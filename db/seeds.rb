unless Rails.env.production?
  admin = User.create(username: "Papako", email: "sylvain.kraisin@gmail.com", password: "password", password_confirmation: "password", role:"admin")

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

  Post.create(
    :title => "Post 1",
    :content => "jdsf kljdskfj sjfdksff mdf dsfdsf dsf jds fdsjfk dkf jdslkf jdskfj dsf jdskf jdslkfj dslkfj lks df
     sd fndslkf jdslkf sdfsdf jdslkfj sdlkfj sdlkfj sdlkfj sdlkf jsdlkf sdlf sdlkf jsdlkfj sdlkfj sdlkfj sdlkfj dslkf lksdj
     lsdkfds lkfjds lkfjsd fkdsjfldsk jfkl j flkj flksj fklds jfdskl fjdslk fjdskl fjsdlkf jsdlkfj sdklf jksldf jskdlf j",
    :author => "Papako",
    :category_id => category.id,
    post_img: "http://s1.lemde.fr/mmpub/edt/zip/2016/01/22/144523341-f12ece18c16623cacddc3a707be10aa6676b4393/assets/images/content/rabesandratana.jpg",
    :image => "http://s1.lemde.fr/mmpub/edt/zip/2016/01/22/144523341-f12ece18c16623cacddc3a707be10aa6676b4393/assets/images/content/rabesandratana.jpg",
    :aasm_state => "online"
  )
end
