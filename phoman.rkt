#lang racket

(require racket/gui/base)
(require framework/preferences)

(define frame (new frame%
                   (label "phoman by .c41x 2019")
                   (width 500)
                   (height 500)))

(define (on-src-path-changed btn evt)
  (preferences:set 'phoman-src-path (send btn get-value)))

(preferences:set-default 'phoman-src-path
                         "/run/media/calx/disk/PRIVATE/AVCHD/BDMV/STREAM/"
                         (lambda (x) #t))

(define src-path (new text-field%
                      (label "Source path")
                      (parent frame)
                      (init-value (preferences:get 'phoman-src-path))
                      (callback on-src-path-changed)))

(define (on-dst-path-changed btn evt)
  (preferences:set 'phoman-dst-path (send btn get-value)))

(preferences:set-default 'phoman-dst-path
                         "/home/calx/shared/zdjecia/"
                         (lambda (x) #t))

(define dst-path (new text-field%
                      (label "Destination path")
                      (parent frame)
                      (init-value (preferences:get 'phoman-dst-path))
                      (callback on-dst-path-changed)))

(send frame show #t)