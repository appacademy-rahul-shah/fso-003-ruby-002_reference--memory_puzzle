# frozen_string_literal: true

class Card
  attr_accessor :face_up, :face_value

  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end

  def to_s
    return face_value.to_s if face_up

    nil
  end

  def ==(other)
    face_value == other.face_value
  end

  def hide
    self.face_up = false
    to_s
  end

  def reveal
    self.face_up = true
    to_s
  end
end
