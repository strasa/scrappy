require 'rails_helper'

describe Material do

   it 'has a name' do
     Material.create({ name:'Argentum' })
   end

end
