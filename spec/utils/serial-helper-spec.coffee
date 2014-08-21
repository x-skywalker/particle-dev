require 'serialport'
require.cache[require.resolve('serialport')].exports = require '../mocks/serialport-success'
SerialHelper = require '../../lib/utils/serial-helper'

describe 'Serial helper tests', ->
  it 'tests listing ports', ->
    promise = SerialHelper.listPorts()

    waitsFor ->
      promise.inspect().state == 'fulfilled'

    runs ->
      status = promise.inspect()
      expect(status.value.length).toBe(1)

  it 'tests retreiving core ID', ->
    promise = SerialHelper.askForCoreID('foo')

    waitsFor ->
      promise.inspect().state == 'fulfilled'

    runs ->
      status = promise.inspect()
      expect(status.value).toBe('0123456789abcdef0123456789abcdef')

  fit 'tests saving WiFi credentials', ->
    promise = SerialHelper.serialWifiConfig('foo', 'ssid', 'pass', 3)

    waitsFor ->
      promise.inspect().state == 'fulfilled'

    runs ->
      status = promise.inspect()
