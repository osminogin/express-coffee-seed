module.exports = (sequelize, DataTypes) ->

  sequelize.define 'Order',

    bid: DataTypes.FLOAT.UNSIGNED
    ask: DataTypes.FLOAT.UNSIGNED
    value:
      type: DataTypes.FLOAT.UNSIGNED
      allowNull: false
      validate:
        notNull: true

#    validate:
#      isCorrectOrder: ->
#        if @bid? is @ask?
#          throw new Error 'Order must be bid or ask (but not both)'
#  }, {
#defaultScope:
#  order: '`ask` DESC'
#}
