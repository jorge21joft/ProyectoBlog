class PostsController < ApplicationController

    # validar que el usuario este registrado para mostrar las vistas que le corresponden
    before_action :authenticate_user!, except: [:index, :show]

    before_action :set_post, except: [:index, :new, :create]


    #a esta ruta se accede con Get/ posts
    def index
        @posts = Post.all
    end

    #Get /post/:id  para tomar el id
    def show
        @post.update_visitas
    end

    #get /post/new 
    def new
      @post = Post.new
    end

    #metodo para editar
    def edit
    end


    #metodo para crear un nuevo post
    def create
        @post =current_user.posts.new(post_params)

        #guardamos
        if @post.save        
           redirect_to posts_path
        else
            render :new
        end    
    end

    #metodo para eliminar
    def destroy      
        @post.destroy  #elimina el objeto
        redirect_to posts_path
    end
    
    #metodo para actualizar registro
    def update     
        if @post.update(post_params)
            redirect_to @post
        else
            render :edit
        end
    end

      private

      def set_post
        # codigo utilizado en las funciones en las que necesitamos  id
        @post = Post.find(params[:id])
      end

     def validate_user
           #redireccionando al usuario si no esta registrado
         redirect_to new_user_session_path, notice: "necesitas iniciar sesión"
     end

        def post_params
          params.require(:post).permit(:titulo,:body)
         end


end