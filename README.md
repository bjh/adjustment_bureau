# AdjustmentBureau

A CSS Property Parser with the simple task of applying a numeric adjustment to property values.  

**NOTE:** this does not parse CSS, it parses CSS property strings only. i.e. `margin: 1px 2px 3px 4px;`.

## Example

```ruby
  # parse the property directly and adjust it
  property = AdjustmentBureau::Property.parse('margin: 1px 2px 3px 4px;')
  property.adjust(:+, 10)
  expect(property.to_s).to eq 'margin: 11px 12px 13px 14px;'  #=> true
```

```ruby
  # set up an adjuster and use it on multiple properties
  properties = [
    'top: 100px;',
    'left: 100px;',
    'width: 100px;',
    'height: 100px;'
  ]

  adjustable_properties = [:top, :left]
  adjustment_operation = :+
  adjustment_amount = 10

  adjuster = AdjustmentBureau::Adjuster.new(
    adjustable_properties,
    adjustment_operation,
    adjustment_amount)

  properties.map! { |p| adjuster.adjust(p).to_s }

  # expected output
  expected = [
    'top: 110px;',
    'left: 110px;',
    'width: 100px;',
    'height: 100px;'
  ]

  expect(properties).to eq expected #=> true
```

## Installation

Add this line to your application's Gemfile:

    gem 'adjustment_bureau'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install adjustment_bureau

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/<my-github-username>/adjustment_bureau/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
