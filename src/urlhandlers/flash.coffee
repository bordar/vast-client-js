class FlashURLHandler
    @xdr: ->
        xdr = new XDomainRequest() if window.XDomainRequest
        return xdr

    @supported: ->
        return !!@xdr()

    @get: (url, headers, timeout, cb) ->
        if xmlDocument = new window.ActiveXObject? "Microsoft.XMLDOM"
          xmlDocument.async = false
        else
          return cb()

        xdr = @xdr()
        xdr.open('GET', url)
        xdr.send()
        xdr.onload = ->
             xmlDocument.loadXML(xdr.responseText)
             cb(null, xmlDocument)

module.exports = FlashURLHandler
