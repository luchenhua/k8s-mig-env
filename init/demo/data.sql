-- REPEAT 1000
-- NAME tbl_user
insert into "tbl_user" (
        "uuid",
        "first_name",
        "last_name",
        "gender",
        "mobile",
        "email",
        "opt_in"
    )
values
{{range $i, $e := ntimes 1000 }}
    {{if $i}},{{end}}
    (
        '{{uuid}}',
        '{{namef}}',
        '{{namel}}',
        '{{set "MALE" "FEMALE"}}',
        '{{string 11 11 "123456789"}}',
        '{{email}}',
        {{set true false}}
    )
{{end}};

-- REPEAT 1000
-- NAME tbl_employee
insert into "tbl_employee" (
        "uuid",
        "first_name",
        "last_name",
        "gender",
        "mobile"
    )
values
{{range $i, $e := ntimes 1000 }}
    {{if $i}},{{end}}
    (
        '{{uuid}}',
        '{{namef}}',
        '{{namel}}',
        '{{set "MALE" "FEMALE"}}',
        '{{string 11 11 "123456789"}}'
    )
{{end}};