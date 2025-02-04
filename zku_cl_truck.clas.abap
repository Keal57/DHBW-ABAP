CLASS zku_cl_truck DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_make            TYPE string
                                  iv_model           TYPE string
                                  iv_production_date TYPE d
                                  iv_torque          TYPE i
                                  iv_price           TYPE i.

    METHODS  display_attributes RETURNING VALUE(rv_attributes) TYPE string.

    INTERFACES zku_if_vehicle .

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA mv_make            TYPE string.
    DATA    mv_model           TYPE string.
    DATA     mv_production_date TYPE d.
    DATA     mv_torque          TYPE i.
    DATA     mv_price           TYPE i.

ENDCLASS.

CLASS zku_cl_truck IMPLEMENTATION.


  METHOD constructor.

    mv_make = iv_make.
    mv_model = iv_model.
    mv_production_date = iv_production_date.
    mv_torque = iv_torque.
    mv_price = iv_price.

  ENDMETHOD.

  METHOD display_attributes.
    rv_attributes = |{ 'Make:' } { mv_make } { 'Model:' } { mv_model } { 'Production Date:' } { mv_production_date } { 'Torque:' } { mv_torque } { 'Price' } { mv_price }|.
  ENDMETHOD.

  METHOD zku_if_vehicle~play_sound.
    rv_result = 'Truck sounds'.
  ENDMETHOD.

ENDCLASS.
