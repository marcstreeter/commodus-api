package main

import (
	"commodus/controller/miembro"
	"fmt"

	echo "github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"github.com/sirupsen/logrus"
	validator "gopkg.in/go-playground/validator.v9"
)

var log = logrus.New()

// Validator validates all request input
type Validator struct{ validator *validator.Validate }

// Validate handles any validator and returns a simple struct
func (v *Validator) Validate(i interface{}) error {
	return v.validator.Struct(i)
}

func init() {
	log.Formatter = new(logrus.JSONFormatter)
	log.Formatter = new(logrus.TextFormatter) // default
	log.Level = logrus.DebugLevel
}

func main() {
	fmt.Println("Main function :")
	e := echo.New()
	e.Validator = &Validator{validator: validator.New()}
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
	// Routes Miembro
	e.POST("/member", miembro.HandleCreate)
	e.PUT("/member/:uuid", miembro.HandleUpdate)
	e.GET("/member", miembro.HandleList)
	e.Logger.Fatal(e.Start(":8080"))
}
