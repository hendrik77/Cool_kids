REPORT zfizzbuzz.

CLASS lcl_fizz_buzz DEFINITION.

  PUBLIC SECTION.
    METHODS fizz_buzz
      IMPORTING
        VALUE(count) TYPE i
      RETURNING
        VALUE(rv_text)  TYPE string.
    METHODS get_next
      IMPORTING
        VALUE(iv_number)  TYPE i
      RETURNING
        VALUE(rv_output) TYPE string.
ENDCLASS.

CLASS lcl_fizz_buzz IMPLEMENTATION.
  METHOD fizz_buzz.
    DO count TIMES.
      rv_text = rv_text && get_next( sy-index ) && |\n|.
    ENDDO.
  ENDMETHOD.

  METHOD get_next.
    rv_output = COND #( WHEN iv_number MOD 3 = 0 AND iv_number MOD 5 = 0 THEN |FizzBuzz|
                        WHEN iv_number MOD 3 = 0 THEN |Fizz|
                        WHEN iv_number MOD 5 = 0 THEN |Buzz|
                        ELSE iv_number ).
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA(fz) = NEW lcl_fizz_buzz( ).
  WRITE |FizzBuzz\n|.
  WRITE fz->fizz_buzz( 50 ).