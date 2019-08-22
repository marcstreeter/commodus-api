# COMMODUS
Easy Group Communication (without talking to the whole group)

## From Scratch Creation

Here is the straight shortest TLDR I can come up with
    eval $(docker-machine env commodus)
    docker-compose up -d db
    docker-compose run api sh
    mix phx.new api --no-html --no-brunch
    # update config/dev.exs database host entry to 'db' per db container
    mix ecto.create
    mix ecto.migrate
    
    mix phx.gen.json Contacto Miembro miembros apellido:string telefono:string
    # resources "/miembros", MiembroController, except: [:new, :edit]
    # ADD ^^ TO api_web/router.ex
    # mix ecto.migrate
    mix phx.gen.json Campana Plantilla plantillas tema:string contenido:string creado:naive_datetime
    # resources "/plantillas", PlantillaController, except: [:new, :edit]
    # ADD ^^ TO api_web/router.ex
    # mix ecto.migrate
    mix phx.gen.json Mensaje Texto textos remitente:string receptor:string contenido:string created:string
    # resources "/textos", TextoController, except: [:new, :edit]
    # ADD ^^ TO api_web/router.ex
    # mix ecto.migrate
    
    # NOW EXIT container and do
    docker-compose up api
    
    # you can now go to 
    #  commodus.test:4000/api/miembros
    #  commodus.test:4000/api/textos
    #  commodus.test:4000/api/plantillas
