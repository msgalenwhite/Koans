require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    assert_equal true, 1.is_a?(Object)
    assert_equal true, 1.5.is_a?(Object)
    assert_equal true, "string".is_a?(Object)
    assert_equal true, nil.is_a?(Object)
    assert_equal true, Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal '123', 123.to_s
    assert_equal '', nil.to_s
  end

  def test_objects_can_be_inspected
    # .inspect will return a STRING containing a "human-readable representation of obj"
    # if you call .inspect on a STRING, it will still return a string, but use escape characters to preserve the original quotation marks

    assert_equal '123', 123.inspect
    assert_equal 'nil', nil.inspect
  end

  def test_every_object_has_an_id
    # why is the id not stored as an integer?

    # the answer was so interesting that I saved it - usually, a value is stored as a pointer to the actual value somewhere else.  For certain things in ruby, this is prevented by storing the ACTUAL value as something that won't be used by anything else

    # However for performance reasons true, false, nil and Fixnum`s are handled specially. For these objects there isn’t actually a struct with the object’s data in memory. All of the object’s data is encoded in the `VALUE itself. As you already figured out the values for false, true, nil and any Fixnum i, are 0, 2, 4 and i*2+1 respectively.
    #
    # The reason that this works is that on any systems that MRI runs on, 0, 2, 4 and i*2+1 are never valid addresses for an object on the heap, so there’s no overlap with pointers to object data.

    obj = Object.new
    assert_equal Fixnum, obj.object_id.class
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    assert_equal __, obj.object_id != another_obj.object_id
  end

  def test_small_integers_have_fixed_ids
    assert_equal __, 0.object_id
    assert_equal __, 1.object_id
    assert_equal __, 2.object_id
    assert_equal __, 100.object_id

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_equal __, obj           != copy
    assert_equal __, obj.object_id != copy.object_id
  end
end
