class Post < ApplicationRecord

    # relacion con la tabla de usuario
    belongs_to :user

    # validaciones para crear un nuebo posts
    validates :titulo,presence: true
    validates :body,presence: true, length: {minimum: 10 }
    before_save :set_visitas


    def update_visitas
        self.visitas ||= 0
        self.update( visitas: self.visitas + 1)
    end
    
    private
   def set_visitas
    self.visitas ||= 0
   end

end
