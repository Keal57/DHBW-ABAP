CLASS zku_cl_car DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    METHODS set_type IMPORTING iv_make  TYPE string
                               iv_model TYPE string.
    METHODS   set_production_date IMPORTING iv_production_date TYPE d.
    METHODS  set_horsepower IMPORTING iv_horsepower TYPE i.
    METHODS   set_price IMPORTING iv_price TYPE int8.
    METHODS    display_attributes RETURNING VALUE(attributes) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA  mv_make            TYPE string.
    DATA  mv_model           TYPE string.
    DATA  mv_production_date TYPE d.
    DATA  mv_horsepower      TYPE i.
    DATA  mv_price           TYPE int8.

ENDCLASS.

CLASS zku_cl_car IMPLEMENTATION.

  METHOD set_type.
    mv_make = iv_make.
    mv_model = iv_model.
  ENDMETHOD.

  METHOD set_production_date.
    mv_production_date = iv_production_date.
  ENDMETHOD.

  METHOD set_horsepower.
    mv_horsepower = iv_horsepower.
  ENDMETHOD.

  METHOD set_price.
    mv_price = iv_price.
  ENDMETHOD.

  METHOD display_attributes.
    attributes = |{ 'Make:' } { mv_make } { 'Model:' } { mv_model } { 'Production Date:' } { mv_production_date } { 'Horsepower:' } { mv_horsepower } { 'Price' } { mv_price }|.
  ENDMETHOD.

ENDCLASS.
