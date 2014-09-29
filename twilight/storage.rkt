#lang racket/base
;
; Storage Manager
;

(require racket/contract
         racket/class
         json)

(require libuuid
         udev
         dds)

(provide
  (contract-out
    (storage-manager% storage-manager/c)))


(define storage-table/c
  (or/c "disk" "volume" "extent" "storage_pool"))

(define create-update-delete/c
  (->m storage-table/c string? jsexpr? void?))

(define storage-manager/c
  (class/c
    (init-field (twilight (object/c)))

    (create create-update-delete/c)
    (update create-update-delete/c)
    (delete create-update-delete/c)

    (on-device-event (->m symbol? device? any/c))
    (on-solver-event (->m symbol? target? any/c void?))

    (get-evt (->m (evt/c string? jsexpr? jsexpr?)))))


(define storage-manager%
  (class object%
    (init-field twilight)

    (define/public (create table pkey data)
      (void))

    (define/public (update table pkey data)
      (void))

    (define/public (delete table pkey data)
      (void))

    (define/public (on-device-event action device)
      (void))

    (define/public (on-solver-event action target result)
      (void))

    (define/public (get-evt)
      never-evt)

    ;; Construct parent object.
    (super-new)))


; vim:set ts=2 sw=2 et: