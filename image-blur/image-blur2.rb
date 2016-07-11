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

  def blur_pixels
    row_index = 0
    pixels_to_set = []
    self.pixels.each do |pixel_row|
      pixel_index = pixel_row.index {|x| x == 1}
      if pixel_index
       pixels_to_set << [row_index, pixel_index]
      end
      row_index += 1
    end

    blur_pixels_around(pixels_to_set)
  end

  def blur_pixels_around(pixel_indexes)
    row_size = self.pixels.length - 1
    pixels_in_row = self.pixels.first.length - 1
    pixel_indexes.each do |pixel_index_pair|
      row_index = pixel_index_pair[0]
      pixel_index = pixel_index_pair[1]
      self.pixels[row_index - 1][pixel_index] = 1 if row_index != 0
      self.pixels[row_index + 1][pixel_index] = 1 if row_index != row_size
      self.pixels[row_index][pixel_index - 1] = 1 if pixel_index != 0
      self.pixels[row_index][pixel_index + 1] = 1 if pixel_index != pixels_in_row
    end
  end
end

image = Image.new([[0, 0, 0, 0],[0, 1, 0, 0],[0, 0, 0, 1],[1, 0, 0, 0]])

image.blur_pixels
image.output_image
