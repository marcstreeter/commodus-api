package logger

import (
	fmt "fmt"

	log "github.com/sirupsen/logrus"
)

// Error logs error
func Error(message string, inputs ...interface{}) {
	log.Error(fmt.Sprintf(message, inputs...))
}

// Info logs info
func Info(message string, inputs ...interface{}) {
	log.Info(fmt.Sprintf(message, inputs...))
}

// Debug logs debug
func Debug(message string, inputs ...interface{}) {
	log.Debug(fmt.Sprintf(message, inputs...))
}
