CLASS zku_cl_abap_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zku_cl_abap_basics IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    out->write( 'Hello World!' ).

    DATA lv_string TYPE string.
    lv_string = 'Hello World!'.
*    out->write( lv_string ).

    DATA lv_date TYPE d.
    lv_date = '20221231'.
*    out->write( lv_date ).

    DATA lv_time TYPE t.
    lv_time = '123456'.
*    out->write( lv_time ).

    DATA lv_integer TYPE i.
    lv_integer = 6666.
*    out->write( lv_time ).

    DATA lv_float TYPE f.
    lv_float = '5.77'.
*    out->write( lv_integer ).

    DATA lv_char TYPE c LENGTH 4.
    lv_char = 'abcd'.
*    out->write( lv_char ).


    DATA lv_packed TYPE p LENGTH 3 DECIMALS 2.
    lv_packed = '333.33'.
*    out->write( lv_packed ).


    "---------------------------------------------------

    "Arithmetische Ausdrücke

    DATA: lv_num1, lv_num2, lv_result TYPE i.

    lv_num1 = 5.
    lv_num2 = 3.

    lv_result = lv_num1 + lv_num2.

*    out->write( lv_result ).

    lv_result = lv_num1 - lv_num2.

*    out->write( lv_result ).

    lv_result = lv_num1 * lv_num2.

*    out->write( lv_result ).

    lv_result = lv_num1 / lv_num2.

*    out->write( lv_result ).

    lv_result = lv_num2 ** 2.

*    out->write( lv_result ).

    lv_result  = lv_num1 DIV lv_num2.

*    out->write( lv_result ).

    lv_result = lv_num1 MOD lv_num2.

*    out->write( lv_result ).

* ----------------------------------------------------------
* IF ANWEISUNG 

    IF lv_result = 0.
*      out->write( 'Kein Rest' ).
    ELSE.
*      out->write( 'Rest' ).
    ENDIF.

* --------------------------------------------------
* CASE

    DATA lv_string1 TYPE string.

    lv_string1 = 'abcdefg'.
    
    CASE lv_string1.
      WHEN 'Hello World!'.
*        out->write( lv_string ).
      WHEN 'Henlo World!'.
*        out->write( 'Hnlo' ).
      WHEN OTHERS.
*        out->write( 'others' ).
    ENDCASE.

* ---------------------------------------------------
* Schleifenkonstrukte

    DATA lv_testnumb1 TYPE i.
    lv_testnumb1 = 1.

    DO.
      IF lv_testnumb1 NOT BETWEEN 0 AND 10.
      EXIT.
      ENDIF.
*      out->write( lv_testnumb1 ).
       ADD 1 TO lv_testnumb1.
    ENDDO.


    lv_testnumb1 = 1.

    WHILE lv_testnumb1 < 10.
      ADD 2 TO lv_testnumb1.
*       out->write( lv_testnumb1 ).
    ENDWHILE.

* ---------------------------------------------------------------------------------------------
* Aufruf von Funktionsbausteinen

    DATA lv_resultfb TYPE p.

    CALL FUNCTION 'BC400_SG_POWER'
      EXPORTING
        iv_base   = 2
        iv_power  = 3
      IMPORTING
        iv_result = lv_resultfb.

*    out->write( lv_resultfb ).

* ------------------------------------------------
* Strukturierte Daten
* Strukturtyp -> Attribute einer Tabelle
* Strukturvariable -> Ein Datensatz

    TYPES: BEGIN OF ts_meinstrukturtyp,

             carid            TYPE string,
             manufacturer     TYPE string,
             model            TYPE string,
             fuel_consumption TYPE p DECIMALS 2 LENGTH 2,
             price            TYPE int8,

           END OF ts_meinstrukturtyp.

    DATA ls_meinstrukturv TYPE ts_meinstrukturtyp.

    ls_meinstrukturv-carid = '001'.
    ls_meinstrukturv-manufacturer = 'Audi'.
    ls_meinstrukturv-model = 'A4'.
    ls_meinstrukturv-fuel_consumption = '7.55'.
    ls_meinstrukturv-price = 50000.

*    out->write( ls_meinstrukturv ).

* -----------------------------------------------
* Interne Tabellen

    TYPES tt_cars TYPE STANDARD TABLE OF ts_meinstrukturtyp WITH KEY carid. " ( lokaler Tabelentyp aus lokalem Strukturtyp )
    DATA gt_car TYPE tt_cars.

* Datensätze erstellen anhand von internen Tabellen

    DATA gs_car LIKE LINE OF gt_car.
    DATA gs_car1 LIKE LINE OF gt_car.
    DATA gs_car2 LIKE LINE OF gt_car.

    gs_car-carid = '001'.
    gs_car-manufacturer = 'Audi'.
    gs_car-model = 'A4'.
    gs_car-fuel_consumption = '7.55'.
    gs_car-price = 54000.

    gs_car1-carid = '002'.
    gs_car1-manufacturer = 'BMW'.
    gs_car1-model = 'M3'.
    gs_car1-fuel_consumption = '9.99'.
    gs_car1-price = 74000.

    gs_car2-carid = '003'.
    gs_car2-manufacturer = 'Mercedes-Benz'.
    gs_car2-model = 'C-Klasse'.
    gs_car2-fuel_consumption = '7.8'.
    gs_car2-price = 60000.

* Die Erstellten Datensätze in die interne Tabelle einfügen

    INSERT gs_car INTO TABLE gt_car.
    INSERT gs_car1 INTO TABLE gt_car.
    INSERT gs_car2 INTO TABLE gt_car.

*    out->write( gt_car ).

* Datensätze interner Tabellen soriteren

    SORT gt_car BY manufacturer ASCENDING.
*    out->write( gt_car ).
    SORT gt_car BY manufacturer DESCENDING.
*    out->write( gt_car ).

* ---------------------------------------- Objektorientierung --------------------------------------------------
* Klasse instanziieren und methoden aufrufen

    DATA go_car1 TYPE REF TO zku_cl_car.
    DATA go_car2 LIKE go_car1.

    CREATE OBJECT go_car1.
    CREATE OBJECT go_car2.

    go_car1->set_type( EXPORTING iv_make  = 'BMW'
                                 iv_model = '330 i' ).
    go_car1->set_production_date( EXPORTING iv_production_date = '20190922' ).
    go_car1->set_horsepower( EXPORTING iv_horsepower = 252 ).
    go_car1->set_price( EXPORTING iv_price = 40000 ).

* Alternativ kann man die Parameter auch direkt angeben ohne EXPORTING
    go_car1->set_price( 65000 ).

    go_car2->set_type( iv_make = 'Mercedes-Benz' iv_model = 'C43 AMG' ).
    go_car2->set_production_date( '20170504' ).
    go_car2->set_horsepower( 367 ).
    go_car2->set_price( 43000 ).

*    out->write( go_car1->display_attributes(  ) ).
*    out->write( go_car2->display_attributes(  ) ).

* Speichern von mehreren Objekten in internen Tabellen

    DATA go_car TYPE REF TO zku_cl_car.

    DATA gt_cars TYPE TABLE OF REF TO zku_cl_car.

    CREATE OBJECT go_car.
    APPEND go_car TO gt_cars.

    go_car->set_type( iv_make = 'Audi' iv_model = 'S4' ).
    go_car->set_production_date( '20170604' ).
    go_car->set_horsepower( 333 ).
    go_car->set_price( 43000 ).

    CREATE OBJECT go_car.
    APPEND go_car TO gt_cars.

    go_car->set_type( iv_make = 'BMW' iv_model = '320d' ).
    go_car->set_production_date( '20150604' ).
    go_car->set_horsepower( 190 ).
    go_car->set_price( 27000 ).


    LOOP AT gt_cars INTO data(ls_car).
*      out->write( ls_car->display_attributes(  ) ).
    ENDLOOP.

* Constructor wird beim create object automatisch aufgerufen

    DATA go_car3 TYPE REF TO zku_cl_car_c.

    CREATE OBJECT go_car3
      EXPORTING
        iv_make            = 'Volkswagen'
        iv_model           = 'Golf'
        iv_production_date = '20220909'
        iv_horsepower      = 105
        iv_price           = 27000.

*    out->write( go_car3->display_attributes(  ) ).

* --------------------------------------------------------------------------------
* ----------------Implementierung von Vererbung mit lokalen Klassen (im Report ---------------

* NEXT: Interfaces, Exceptions, Tests und umfassende objektorientierte Anwendung als Abschluss

    DATA:
      go_car4  LIKE go_car3,
      go_truck TYPE REF TO zku_cl_truck.


    CREATE OBJECT go_car3
      EXPORTING
        iv_make            = 'Opel'
        iv_model           = 'Insignia OPC'
        iv_production_date = '20200525'
        iv_horsepower      = 330
        iv_price           = 65000.

    CREATE OBJECT go_truck
      EXPORTING
        iv_make            = 'DAF'
        iv_model           = 'XF Euro6'
        iv_production_date = '20170105'
        iv_torque          = 1750
        iv_price           = 125000.

*    out->write( go_car3->zku_if_vehicle~play_sound(  ) ).
*    out->write( go_truck->zku_if_vehicle~play_sound(  ) ).

    "---------------------------------------------------
    "BW-Kalender erstellen
    "---------------------------------------------------
    TRY.
        DATA(calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
      CATCH cx_fhc_runtime.
        RETURN.
    ENDTRY.
    
    "---------------------------------------------------
    "Werktage zählen
    "---------------------------------------------------
          TRY.
          DATA(working_days) = ( calendar->calc_workingdays_between_dates( iv_start = '20250113' iv_end = '20250115' ) ) + 1.
        CATCH cx_fhc_runtime.
          RETURN.
      ENDTRY.

*      out->write( working_days ).

  ENDMETHOD.
ENDCLASS.
