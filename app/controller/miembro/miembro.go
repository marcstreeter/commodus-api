package miembro

import (
	log "commodus/internal/logger"
	model "commodus/model"
	miembro "commodus/model/miembro"
	http "net/http"

	schema "github.com/gorilla/schema"
	echo "github.com/labstack/echo/v4"
)

// Constants
var systemError model.Error = model.Error{
	Slug:    "internal",
	Message: "Failed to save due to system error...",
}

// Validators

// ListQuery validator
type ListQuery struct {
	Page  int `schema:"page" validate:"gte=0"`
	Count int `schema:"count" validate:"gte=0,lte=500"`
}

type UpdateQuery struct {
	Name      string `json:"name" validate:"required"`
	Telephone string `json:"telephone" validate:"required"`
}

// HandleCreate handler for creating Miembro's
func HandleCreate(c echo.Context) (err error) {
	log.Info("recieved request to create new miembro")
	m := new(miembro.Miembro)

	if err = c.Bind(m); err != nil {
		return c.JSON(http.StatusInternalServerError, systemError)
	}

	if err = m.Save(); err != nil {
		return c.JSON(http.StatusInternalServerError, systemError)
	}

	return c.JSON(http.StatusOK, m)
}

// HandleList handler for listing Miembro's
func HandleList(c echo.Context) (err error) {
	log.Info("received request to list miembros por favor")
	query := new(ListQuery)
	decoder := schema.NewDecoder()
	r := c.Request()

	if err := r.ParseForm(); err != nil {
		log.Error("Failed to parse form %v", err)
		return c.JSON(http.StatusInternalServerError, systemError)
	}

	if err = decoder.Decode(query, r.Form); err != nil {
		log.Error("Failed to decode form %v", err)
		return c.JSON(http.StatusInternalServerError, systemError)
	}

	if err = c.Validate(query); err != nil {
		return c.JSON(
			http.StatusBadRequest,
			model.Error{
				Slug:    "invalid",
				Message: err.Error(),
			},
		)
	}

	miembros, err := miembro.List(query.Page, query.Count)

	return c.JSON(http.StatusOK, miembros)
}

func HandleUpdate(c echo.Context) (err error) {
	uuid := c.Param("id")
	query := new(UpdateQuery)

	if err = c.Bind(query); err != nil {
		return c.JSON(http.StatusInternalServerError, systemError)
	}

	if err = c.Validate(query); err != nil {
		return c.JSON(
			http.StatusBadRequest,
			model.Error{
				Slug:    "invalid",
				Message: err.Error(),
			},
		)
	}

	m := miembro.Miembro{Uuid: uuid, Telephone: query.Telephone, Name: query.Telephone}

	if err = m.Update(); err != nil {
		return c.JSON(
			http.StatusBadRequest,
			model.Error{
				Slug:    "invalid",
				Message: err.Error(),
			},
		)
	}

	return c.JSON(http.StatusNoContent, nil)
}
