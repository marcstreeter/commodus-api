package miembro

import (
	db "commodus/internal/db"
	log "commodus/internal/logger"
	fmt "fmt"
)

type Miembro struct {
	Uuid      string `json:"uuid" form:"uuid"`
	Name      string `json:"name" form:"name"`
	Telephone string `json:"telephone" form:"telephone"`
}

// create
func (m Miembro) Save() (err error) {
	conn, err := db.Connection()

	if err != nil {
		log.Error("failed to save Miembro: %s", err)
		return err
	}

	defer conn.Close()
	log.Info("Connected to DB")
	log.Info("saving member(%s, %s, %s)", m.Uuid, m.Name, m.Telephone)
	_, err = conn.Query("INSERT INTO members(uuid,name,telephone) VALUES($1,$2,$3);",
		m.Uuid, m.Name, m.Telephone)

	if err != nil {
		log.Error("failed member creation: %s", err)
		return err
	}

	log.Info("created member")
	return nil
}

// read
func List(page int, count int) (*[]Miembro, error) {
	miembros := []Miembro{}
	pagingClause := db.PagingClause(page, count)
	activeClause := db.ActiveClause(true)
	conn, err := db.Connection()

	if err != nil {
		log.Error("failed to list Miembros: %s", err)
		return nil, err
	}

	defer conn.Close()

	queryString := fmt.Sprintf("SELECT uuid, name, telephone FROM members WHERE %s %s;", activeClause, pagingClause)
	log.Info("PANTERA sending queryString %s", queryString)
	rows, err := conn.Query(queryString)

	if err != nil {
		log.Error("failed to query db: %s", err)
		return nil, err
	}

	defer rows.Close()

	for rows.Next() {
		m := Miembro{}
		err = rows.Scan(&m.Uuid, &m.Name, &m.Telephone)

		if err != nil {
			log.Error("failed to parse results: %s", err)
			return nil, err
		}
		miembros = append(miembros, m)
	}

	err = rows.Err()

	if err != nil {
		log.Error("failed to parse rows: %s", err)
		return nil, err
	}

	return &miembros, nil
}

// update

func (m Miembro) Update() (err error) {
	conn, err := db.Connection()

	if err != nil {
		log.Error("failed to save Miembro: %s", err)
		return err
	}

	defer conn.Close()
	log.Info("Connected to DB")
	log.Info("updating member(%s, %s, %s)", m.Uuid, m.Name, m.Telephone)
	_, err = conn.Query("UPDATE members SET name=$1 telephone=$2 WHERE uuid=$3;",
		m.Name, m.Telephone, m.Uuid)

	if err != nil {
		log.Error("failed member update: %s", err)
		return err
	}

	log.Info("updated member")
	return nil
}

// delete (soft delete, inactivate)
// docker run -p 0.0.0.0:8080:8080 api
