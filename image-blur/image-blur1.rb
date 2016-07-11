class Image
  attr_accessor :pixels

  def initialize(arr)
    @pixels = arr
  end

  def output_image
    @pixels.each do |pixel_row|
      pixels_to_print = ""
      pixel_row.each do |pixel|
        pixels_to_print << "#{pixel}"
      end
      puts pixels_to_print
    end
  end
end

image = Image.new([[0, 0, 0, 0],[0, 1, 0, 0],[0, 0, 0, 1],[0, 0, 0, 0]])

image.output_image