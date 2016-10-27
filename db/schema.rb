# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "Persons", id: false, force: :cascade do |t|
    t.integer "PersonID",  limit: 4
    t.string  "LastName",  limit: 255
    t.string  "FirstName", limit: 255
    t.string  "Address",   limit: 255
    t.string  "City",      limit: 255
  end

  create_table "mbit_fiskal", id: false, force: :cascade do |t|
    t.string "opcija",     limit: 40
    t.string "vrijednost", limit: 200
  end

  create_table "mbit_fiskal_greske", force: :cascade do |t|
    t.string   "fiscal_invoice", limit: 200,   null: false
    t.integer  "whmcs_invoice",  limit: 4,     null: false
    t.text     "errors",         limit: 65535
    t.datetime "date"
  end

  create_table "mbit_fiskal_operateri", force: :cascade do |t|
    t.string "naziv",        limit: 100, null: false
    t.string "oznaka",       limit: 20,  null: false
    t.string "oib",          limit: 20,  null: false
    t.string "vezani_admin", limit: 50
  end

  create_table "mbit_fiskal_racuni", force: :cascade do |t|
    t.integer  "userid",         limit: 4,                            null: false
    t.string   "fiscal_invoice", limit: 200,                          null: false
    t.integer  "whmcs_invoice",  limit: 4,                            null: false
    t.integer  "invoicenum",     limit: 4,                            null: false
    t.decimal  "amount",                     precision: 10, scale: 2
    t.string   "jir",            limit: 200,                          null: false
    t.string   "zki",            limit: 200,                          null: false
    t.datetime "date"
    t.integer  "operaterid",     limit: 4,                            null: false
    t.integer  "uredajid",       limit: 4,                            null: false
    t.integer  "fiskalizirati",  limit: 4,                            null: false
  end

  create_table "mbit_fiskal_storno", force: :cascade do |t|
    t.integer "invoiceid",  limit: 4, null: false
    t.integer "operaterid", limit: 4, null: false
  end

  create_table "mbit_fiskal_uredaji", force: :cascade do |t|
    t.string  "naziv",            limit: 200, null: false
    t.string  "tip_placanja",     limit: 50,  null: false
    t.string  "opis_placanja",    limit: 150, null: false
    t.integer "fiskalizirati",    limit: 4,   null: false
    t.integer "sljedeci_racun",   limit: 4,   null: false
    t.string  "oznaka_blagajne",  limit: 10,  null: false
    t.integer "default_operater", limit: 4
    t.string  "vezani_gateway",   limit: 50,  null: false
  end

  create_table "mod_cachedinvoices_invoices", force: :cascade do |t|
    t.integer "invoiceID",      limit: 4,                  null: false
    t.integer "currencyID",     limit: 4,                  null: false
    t.integer "currencyFormat", limit: 4,                  null: false
    t.string  "prefix",         limit: 10,    default: ""
    t.string  "suffix",         limit: 10,    default: ""
    t.text    "customFields",   limit: 65535,              null: false
    t.text    "clientsDetails", limit: 65535,              null: false
  end

  create_table "mod_cachedinvoices_settings", primary_key: "cacheType", force: :cascade do |t|
    t.string  "folderPath",      limit: 150,                       null: false
    t.integer "useSubfolders",   limit: 4,     default: 1,         null: false
    t.integer "activityLog",     limit: 4,     default: 0,         null: false
    t.integer "autoCache",       limit: 4,     default: 0,         null: false
    t.string  "moduleLanguage",  limit: 25,    default: "english", null: false
    t.text    "localKey",        limit: 65535
    t.string  "apiAdmin",        limit: 20
    t.integer "dropboxArchive",  limit: 4,     default: 0,         null: false
    t.text    "dropboxAuthcode", limit: 65535
    t.integer "ftpArchive",      limit: 4,     default: 0,         null: false
    t.text    "ftpServer",       limit: 65535
    t.text    "ftpUser",         limit: 65535
    t.text    "ftpPassword",     limit: 65535
    t.integer "ftpPort",         limit: 4,     default: 21,        null: false
    t.text    "ftpFolder",       limit: 65535
  end

  create_table "mod_infonet_racuni", primary_key: "eirafolder", force: :cascade do |t|
    t.string  "euzemlje",       limit: 450
    t.string  "eiraeunaziv",    limit: 25
    t.string  "eiranoneunaziv", limit: 25
    t.string  "eiratxtfile",    limit: 50
    t.string  "xlsfolder",      limit: 200
    t.string  "xlsnaziv",       limit: 200
    t.string  "apiadmin",       limit: 30
    t.string  "mail",           limit: 100
    t.integer "aktivan",        limit: 4,   default: 0
  end

  create_table "mod_invoicedata", id: false, force: :cascade do |t|
    t.integer "invoiceid",      limit: 4,     null: false
    t.text    "clientsdetails", limit: 65535, null: false
    t.text    "customfields",   limit: 65535, null: false
  end

  create_table "mod_onlinenic", force: :cascade do |t|
    t.string  "domain",     limit: 255,                 null: false
    t.boolean "lockstatus",             default: false, null: false
  end

  add_index "mod_onlinenic", ["domain"], name: "domainid", using: :btree

  create_table "tblaccounts", force: :cascade do |t|
    t.integer  "userid",      limit: 4,                                            null: false
    t.integer  "currency",    limit: 4,                                            null: false
    t.text     "gateway",     limit: 65535,                                        null: false
    t.datetime "date"
    t.text     "description", limit: 65535,                                        null: false
    t.decimal  "amountin",                  precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "fees",                      precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "amountout",                 precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "rate",                      precision: 10, scale: 5, default: 1.0, null: false
    t.text     "transid",     limit: 65535,                                        null: false
    t.integer  "invoiceid",   limit: 4,                              default: 0,   null: false
    t.integer  "refundid",    limit: 4,                              default: 0,   null: false
  end

  add_index "tblaccounts", ["date"], name: "date", using: :btree
  add_index "tblaccounts", ["invoiceid"], name: "invoiceid", using: :btree
  add_index "tblaccounts", ["transid"], name: "transid", length: {"transid"=>32}, using: :btree
  add_index "tblaccounts", ["userid"], name: "userid", using: :btree

  create_table "tblactivitylog", force: :cascade do |t|
    t.datetime "date",                      null: false
    t.text     "description", limit: 65535, null: false
    t.text     "user",        limit: 65535, null: false
    t.integer  "userid",      limit: 4,     null: false
    t.text     "ipaddr",      limit: 65535, null: false
  end

  add_index "tblactivitylog", ["userid"], name: "userid", using: :btree

  create_table "tbladdonmodules", id: false, force: :cascade do |t|
    t.text "module",  limit: 65535, null: false
    t.text "setting", limit: 65535, null: false
    t.text "value",   limit: 65535, null: false
  end

  create_table "tbladdons", force: :cascade do |t|
    t.text    "packages",       limit: 65535,             null: false
    t.text    "name",           limit: 65535,             null: false
    t.text    "description",    limit: 65535,             null: false
    t.text    "billingcycle",   limit: 65535,             null: false
    t.text    "tax",            limit: 65535,             null: false
    t.text    "showorder",      limit: 65535,             null: false
    t.text    "downloads",      limit: 65535,             null: false
    t.text    "autoactivate",   limit: 65535,             null: false
    t.text    "suspendproduct", limit: 65535,             null: false
    t.integer "welcomeemail",   limit: 4,                 null: false
    t.integer "weight",         limit: 4,     default: 0, null: false
  end

  add_index "tbladdons", ["name"], name: "name", length: {"name"=>32}, using: :btree

  create_table "tbladminlog", force: :cascade do |t|
    t.text     "adminusername", limit: 65535, null: false
    t.datetime "logintime",                   null: false
    t.datetime "logouttime",                  null: false
    t.text     "ipaddress",     limit: 65535, null: false
    t.text     "sessionid",     limit: 65535, null: false
    t.datetime "lastvisit",                   null: false
  end

  add_index "tbladminlog", ["logouttime"], name: "logouttime", using: :btree

  create_table "tbladminperms", id: false, force: :cascade do |t|
    t.integer "roleid", limit: 4, null: false
    t.integer "permid", limit: 4, null: false
  end

  add_index "tbladminperms", ["roleid", "permid"], name: "roleid_permid", using: :btree

  create_table "tbladminroles", force: :cascade do |t|
    t.text    "name",          limit: 65535, null: false
    t.text    "widgets",       limit: 65535, null: false
    t.integer "systememails",  limit: 4,     null: false
    t.integer "accountemails", limit: 4,     null: false
    t.integer "supportemails", limit: 4,     null: false
  end

  create_table "tbladmins", force: :cascade do |t|
    t.string  "uuid",                limit: 255,   default: "", null: false
    t.integer "roleid",              limit: 4,                  null: false
    t.text    "username",            limit: 65535,              null: false
    t.string  "password",            limit: 255,   default: "", null: false
    t.string  "passwordhash",        limit: 255,   default: "", null: false
    t.text    "authmodule",          limit: 65535,              null: false
    t.text    "authdata",            limit: 65535,              null: false
    t.text    "firstname",           limit: 65535,              null: false
    t.text    "lastname",            limit: 65535,              null: false
    t.text    "email",               limit: 65535,              null: false
    t.text    "signature",           limit: 65535,              null: false
    t.text    "notes",               limit: 65535,              null: false
    t.text    "template",            limit: 65535,              null: false
    t.text    "language",            limit: 65535,              null: false
    t.integer "disabled",            limit: 4,                  null: false
    t.integer "loginattempts",       limit: 4,                  null: false
    t.text    "supportdepts",        limit: 65535,              null: false
    t.text    "ticketnotifications", limit: 65535,              null: false
    t.text    "homewidgets",         limit: 65535,              null: false
  end

  add_index "tbladmins", ["username"], name: "username", length: {"username"=>32}, using: :btree

  create_table "tbladminsecurityquestions", force: :cascade do |t|
    t.text     "question",   limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tblaffiliates", id: false, force: :cascade do |t|
    t.integer  "id",         limit: 4,                                            null: false
    t.date     "date"
    t.integer  "clientid",   limit: 4,                                            null: false
    t.integer  "visitors",   limit: 4,                                            null: false
    t.text     "paytype",    limit: 65535,                                        null: false
    t.decimal  "payamount",                precision: 10, scale: 2,               null: false
    t.integer  "onetime",    limit: 4,                                            null: false
    t.decimal  "balance",                  precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "withdrawn",                precision: 10, scale: 2, default: 0.0, null: false
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "tblaffiliates", ["clientid"], name: "clientid", using: :btree
  add_index "tblaffiliates", ["id"], name: "affiliateid", using: :btree

  create_table "tblaffiliatesaccounts", force: :cascade do |t|
    t.integer "affiliateid", limit: 4, null: false
    t.integer "relid",       limit: 4, null: false
    t.date    "lastpaid",              null: false
  end

  add_index "tblaffiliatesaccounts", ["affiliateid"], name: "affiliateid", using: :btree

  create_table "tblaffiliateshistory", force: :cascade do |t|
    t.integer "affiliateid", limit: 4,                              null: false
    t.date    "date",                                               null: false
    t.integer "affaccid",    limit: 4,                              null: false
    t.text    "description", limit: 65535,                          null: false
    t.decimal "amount",                    precision: 10, scale: 2, null: false
  end

  add_index "tblaffiliateshistory", ["affiliateid"], name: "affiliateid", using: :btree

  create_table "tblaffiliatespending", force: :cascade do |t|
    t.integer "affaccid",     limit: 4,                          default: 0, null: false
    t.decimal "amount",                 precision: 10, scale: 2,             null: false
    t.date    "clearingdate",                                                null: false
  end

  add_index "tblaffiliatespending", ["clearingdate"], name: "clearingdate", using: :btree

  create_table "tblaffiliateswithdrawals", force: :cascade do |t|
    t.integer "affiliateid", limit: 4,                          null: false
    t.date    "date",                                           null: false
    t.decimal "amount",                precision: 10, scale: 2, null: false
  end

  add_index "tblaffiliateswithdrawals", ["affiliateid"], name: "affiliateid", using: :btree

  create_table "tblannouncements", force: :cascade do |t|
    t.datetime "date"
    t.text     "title",        limit: 65535, null: false
    t.text     "announcement", limit: 65535, null: false
    t.boolean  "published",                  null: false
    t.integer  "parentid",     limit: 4,     null: false
    t.text     "language",     limit: 65535, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tblannouncements", ["date"], name: "date", using: :btree

  create_table "tblapplinks", force: :cascade do |t|
    t.string   "module_type", limit: 20, default: "", null: false
    t.string   "module_name", limit: 50, default: "", null: false
    t.integer  "is_enabled",  limit: 1,  default: 0,  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "tblapplinks_links", force: :cascade do |t|
    t.integer  "applink_id",    limit: 4,   default: 0,  null: false
    t.string   "scope",         limit: 80,  default: "", null: false
    t.string   "display_label", limit: 256, default: "", null: false
    t.integer  "is_enabled",    limit: 1,   default: 0,  null: false
    t.integer  "order",         limit: 1,   default: 0,  null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "tblapplinks_log", force: :cascade do |t|
    t.integer  "applink_id", limit: 4,    default: 0,  null: false
    t.string   "message",    limit: 2000, default: "", null: false
    t.integer  "level",      limit: 4,    default: 0,  null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "tblbannedemails", force: :cascade do |t|
    t.text    "domain", limit: 65535,             null: false
    t.integer "count",  limit: 4,     default: 0, null: false
  end

  add_index "tblbannedemails", ["domain"], name: "domain", length: {"domain"=>64}, using: :btree

  create_table "tblbannedips", force: :cascade do |t|
    t.text     "ip",      limit: 65535, null: false
    t.text     "reason",  limit: 65535, null: false
    t.datetime "expires",               null: false
  end

  add_index "tblbannedips", ["ip"], name: "ip", length: {"ip"=>32}, using: :btree

  create_table "tblbillableitems", force: :cascade do |t|
    t.integer "userid",        limit: 4,                                          null: false
    t.text    "description",   limit: 65535,                                      null: false
    t.decimal "hours",                       precision: 5,  scale: 1,             null: false
    t.decimal "amount",                      precision: 10, scale: 2,             null: false
    t.integer "recur",         limit: 4,                              default: 0, null: false
    t.text    "recurcycle",    limit: 65535,                                      null: false
    t.integer "recurfor",      limit: 4,                              default: 0, null: false
    t.integer "invoiceaction", limit: 4,                                          null: false
    t.date    "duedate",                                                          null: false
    t.integer "invoicecount",  limit: 4,                              default: 0, null: false
  end

  create_table "tblbrowserlinks", force: :cascade do |t|
    t.text "name", limit: 65535, null: false
    t.text "url",  limit: 65535, null: false
  end

  add_index "tblbrowserlinks", ["name"], name: "name", length: {"name"=>32}, using: :btree

  create_table "tblbundles", force: :cascade do |t|
    t.text    "name",         limit: 65535,                          null: false
    t.date    "validfrom",                                           null: false
    t.date    "validuntil",                                          null: false
    t.integer "uses",         limit: 4,                              null: false
    t.integer "maxuses",      limit: 4,                              null: false
    t.text    "itemdata",     limit: 65535,                          null: false
    t.integer "allowpromo",   limit: 4,                              null: false
    t.integer "showgroup",    limit: 4,                              null: false
    t.integer "gid",          limit: 4,                              null: false
    t.text    "description",  limit: 65535,                          null: false
    t.decimal "displayprice",               precision: 10, scale: 2, null: false
    t.integer "sortorder",    limit: 4,                              null: false
    t.boolean "is_featured",                                         null: false
  end

  create_table "tblcalendar", force: :cascade do |t|
    t.text    "title",   limit: 65535, null: false
    t.text    "desc",    limit: 65535, null: false
    t.integer "start",   limit: 4,     null: false
    t.integer "end",     limit: 4,     null: false
    t.integer "allday",  limit: 4,     null: false
    t.integer "adminid", limit: 4,     null: false
    t.integer "recurid", limit: 4,     null: false
  end

  create_table "tblcancelrequests", force: :cascade do |t|
    t.datetime "date",                     null: false
    t.integer  "relid",      limit: 4,     null: false
    t.text     "reason",     limit: 65535, null: false
    t.text     "type",       limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "tblcancelrequests", ["relid"], name: "serviceid", using: :btree

  create_table "tblclientgroups", force: :cascade do |t|
    t.string  "groupname",        limit: 45,                                           null: false
    t.string  "groupcolour",      limit: 45
    t.decimal "discountpercent",                precision: 10, scale: 2, default: 0.0
    t.text    "susptermexempt",   limit: 65535
    t.text    "separateinvoices", limit: 65535,                                        null: false
  end

  create_table "tblclients", force: :cascade do |t|
    t.string   "uuid",              limit: 255,                            default: "",       null: false
    t.text     "firstname",         limit: 65535,                                             null: false
    t.text     "lastname",          limit: 65535,                                             null: false
    t.text     "companyname",       limit: 65535,                                             null: false
    t.text     "email",             limit: 65535,                                             null: false
    t.text     "address1",          limit: 65535,                                             null: false
    t.text     "address2",          limit: 65535,                                             null: false
    t.text     "city",              limit: 65535,                                             null: false
    t.text     "state",             limit: 65535,                                             null: false
    t.text     "postcode",          limit: 65535,                                             null: false
    t.text     "country",           limit: 65535,                                             null: false
    t.text     "phonenumber",       limit: 65535,                                             null: false
    t.text     "password",          limit: 65535,                                             null: false
    t.text     "authmodule",        limit: 65535,                                             null: false
    t.text     "authdata",          limit: 65535,                                             null: false
    t.integer  "currency",          limit: 4,                                                 null: false
    t.text     "defaultgateway",    limit: 65535,                                             null: false
    t.decimal  "credit",                          precision: 10, scale: 2,                    null: false
    t.boolean  "taxexempt",                                                                   null: false
    t.boolean  "latefeeoveride",                                                              null: false
    t.boolean  "overideduenotices",                                                           null: false
    t.boolean  "separateinvoices",                                                            null: false
    t.boolean  "disableautocc",                                                               null: false
    t.date     "datecreated",                                                                 null: false
    t.text     "notes",             limit: 65535,                                             null: false
    t.integer  "billingcid",        limit: 4,                                                 null: false
    t.integer  "securityqid",       limit: 4,                                                 null: false
    t.text     "securityqans",      limit: 65535,                                             null: false
    t.integer  "groupid",           limit: 4,                                                 null: false
    t.string   "cardtype",          limit: 255,                            default: "",       null: false
    t.text     "cardlastfour",      limit: 65535,                                             null: false
    t.binary   "cardnum",           limit: 65535,                                             null: false
    t.binary   "startdate",         limit: 65535,                                             null: false
    t.binary   "expdate",           limit: 65535,                                             null: false
    t.binary   "issuenumber",       limit: 65535,                                             null: false
    t.text     "bankname",          limit: 65535,                                             null: false
    t.text     "banktype",          limit: 65535,                                             null: false
    t.binary   "bankcode",          limit: 65535,                                             null: false
    t.binary   "bankacct",          limit: 65535,                                             null: false
    t.text     "gatewayid",         limit: 65535,                                             null: false
    t.datetime "lastlogin"
    t.text     "ip",                limit: 65535,                                             null: false
    t.text     "host",              limit: 65535,                                             null: false
    t.string   "status",            limit: 8,                              default: "Active", null: false
    t.text     "language",          limit: 65535,                                             null: false
    t.text     "pwresetkey",        limit: 65535,                                             null: false
    t.integer  "emailoptout",       limit: 4,                                                 null: false
    t.integer  "overrideautoclose", limit: 4,                                                 null: false
    t.boolean  "allow_sso",                                                default: true,     null: false
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
    t.datetime "pwresetexpiry",                                                               null: false
  end

  add_index "tblclients", ["email"], name: "email", length: {"email"=>64}, using: :btree
  add_index "tblclients", ["firstname", "lastname"], name: "firstname_lastname", length: {"firstname"=>32, "lastname"=>32}, using: :btree

  create_table "tblclientsfiles", force: :cascade do |t|
    t.integer "userid",    limit: 4,     null: false
    t.text    "title",     limit: 65535, null: false
    t.text    "filename",  limit: 65535, null: false
    t.integer "adminonly", limit: 4,     null: false
    t.date    "dateadded",               null: false
  end

  create_table "tblconfiguration", id: false, force: :cascade do |t|
    t.text     "setting",    limit: 65535, null: false
    t.text     "value",      limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "tblconfiguration", ["setting"], name: "setting", length: {"setting"=>32}, using: :btree

  create_table "tblcontacts", force: :cascade do |t|
    t.integer  "userid",          limit: 4,                 null: false
    t.text     "firstname",       limit: 65535,             null: false
    t.text     "lastname",        limit: 65535,             null: false
    t.text     "companyname",     limit: 65535,             null: false
    t.text     "email",           limit: 65535,             null: false
    t.text     "address1",        limit: 65535,             null: false
    t.text     "address2",        limit: 65535,             null: false
    t.text     "city",            limit: 65535,             null: false
    t.text     "state",           limit: 65535,             null: false
    t.text     "postcode",        limit: 65535,             null: false
    t.text     "country",         limit: 65535,             null: false
    t.text     "phonenumber",     limit: 65535,             null: false
    t.integer  "subaccount",      limit: 4,     default: 0, null: false
    t.text     "password",        limit: 65535,             null: false
    t.text     "permissions",     limit: 65535,             null: false
    t.integer  "domainemails",    limit: 4,                 null: false
    t.integer  "generalemails",   limit: 4,                 null: false
    t.integer  "invoiceemails",   limit: 4,                 null: false
    t.integer  "productemails",   limit: 4,                 null: false
    t.integer  "supportemails",   limit: 4,                 null: false
    t.integer  "affiliateemails", limit: 4,                 null: false
    t.text     "pwresetkey",      limit: 65535,             null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.datetime "pwresetexpiry",                             null: false
  end

  add_index "tblcontacts", ["email"], name: "email", length: {"email"=>64}, using: :btree
  add_index "tblcontacts", ["userid", "firstname", "lastname"], name: "userid_firstname_lastname", length: {"userid"=>nil, "firstname"=>32, "lastname"=>32}, using: :btree

  create_table "tblcoupons", primary_key: "coupon", force: :cascade do |t|
    t.string  "status",    limit: 255, default: "Unused"
    t.integer "userid",    limit: 4
    t.integer "serviceid", limit: 4
  end

  add_index "tblcoupons", ["coupon"], name: "coupon", unique: true, using: :btree
  add_index "tblcoupons", ["coupon"], name: "coupon_2", using: :btree
  add_index "tblcoupons", ["serviceid"], name: "serviceid", unique: true, using: :btree

  create_table "tblcredit", force: :cascade do |t|
    t.integer "clientid",    limit: 4,                                          null: false
    t.date    "date",                                                           null: false
    t.text    "description", limit: 65535,                                      null: false
    t.decimal "amount",                    precision: 10, scale: 2,             null: false
    t.integer "relid",       limit: 4,                              default: 0, null: false
  end

  create_table "tblcurrencies", force: :cascade do |t|
    t.text    "code",    limit: 65535,                                        null: false
    t.text    "prefix",  limit: 65535,                                        null: false
    t.text    "suffix",  limit: 65535,                                        null: false
    t.integer "format",  limit: 4,                                            null: false
    t.decimal "rate",                  precision: 10, scale: 5, default: 1.0, null: false
    t.integer "default", limit: 4,                                            null: false
  end

  create_table "tblcustomfields", force: :cascade do |t|
    t.text    "type",         limit: 65535,             null: false
    t.integer "relid",        limit: 4,     default: 0, null: false
    t.text    "fieldname",    limit: 65535,             null: false
    t.text    "fieldtype",    limit: 65535,             null: false
    t.text    "description",  limit: 65535,             null: false
    t.text    "fieldoptions", limit: 65535,             null: false
    t.text    "regexpr",      limit: 65535,             null: false
    t.text    "adminonly",    limit: 65535,             null: false
    t.text    "required",     limit: 65535,             null: false
    t.text    "showorder",    limit: 65535,             null: false
    t.text    "showinvoice",  limit: 65535,             null: false
    t.integer "sortorder",    limit: 4,     default: 0, null: false
  end

  add_index "tblcustomfields", ["relid"], name: "serviceid", using: :btree

  create_table "tblcustomfieldsvalues", id: false, force: :cascade do |t|
    t.integer "fieldid", limit: 4,     null: false
    t.integer "relid",   limit: 4,     null: false
    t.text    "value",   limit: 65535, null: false
  end

  add_index "tblcustomfieldsvalues", ["fieldid", "relid"], name: "fieldid_relid", using: :btree

  create_table "tbldomainpricing", force: :cascade do |t|
    t.text    "extension",       limit: 65535,             null: false
    t.text    "dnsmanagement",   limit: 65535,             null: false
    t.text    "emailforwarding", limit: 65535,             null: false
    t.text    "idprotection",    limit: 65535,             null: false
    t.text    "eppcode",         limit: 65535,             null: false
    t.text    "autoreg",         limit: 65535,             null: false
    t.integer "order",           limit: 4,     default: 0, null: false
  end

  add_index "tbldomainpricing", ["extension"], name: "extension_registrationperiod", length: {"extension"=>32}, using: :btree
  add_index "tbldomainpricing", ["order"], name: "order", using: :btree

  create_table "tbldomainreminders", force: :cascade do |t|
    t.integer "domain_id",          limit: 4,     null: false
    t.date    "date",                             null: false
    t.text    "recipients",         limit: 65535, null: false
    t.integer "type",               limit: 1,     null: false
    t.integer "days_before_expiry", limit: 1,     null: false
  end

  create_table "tbldomains", force: :cascade do |t|
    t.integer  "userid",             limit: 4,                                                  null: false
    t.integer  "orderid",            limit: 4,                                                  null: false
    t.string   "type",               limit: 8,                                                  null: false
    t.date     "registrationdate",                                                              null: false
    t.text     "domain",             limit: 65535,                                              null: false
    t.decimal  "firstpaymentamount",               precision: 10, scale: 2, default: 0.0,       null: false
    t.decimal  "recurringamount",                  precision: 10, scale: 2,                     null: false
    t.text     "registrar",          limit: 65535,                                              null: false
    t.integer  "registrationperiod", limit: 4,                              default: 1,         null: false
    t.date     "expirydate"
    t.text     "subscriptionid",     limit: 65535,                                              null: false
    t.integer  "promoid",            limit: 4,                                                  null: false
    t.string   "status",             limit: 16,                             default: "Pending", null: false
    t.date     "nextduedate",                                                                   null: false
    t.date     "nextinvoicedate",                                                               null: false
    t.text     "additionalnotes",    limit: 65535,                                              null: false
    t.text     "paymentmethod",      limit: 65535,                                              null: false
    t.boolean  "dnsmanagement",                                                                 null: false
    t.boolean  "emailforwarding",                                                               null: false
    t.boolean  "idprotection",                                                                  null: false
    t.boolean  "donotrenew",                                                                    null: false
    t.text     "reminders",          limit: 65535,                                              null: false
    t.boolean  "synced",                                                                        null: false
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
  end

  add_index "tbldomains", ["domain"], name: "domain", length: {"domain"=>64}, using: :btree
  add_index "tbldomains", ["orderid"], name: "orderid", using: :btree
  add_index "tbldomains", ["status"], name: "status", using: :btree
  add_index "tbldomains", ["userid"], name: "userid", using: :btree

  create_table "tbldomainsadditionalfields", force: :cascade do |t|
    t.integer  "domainid",   limit: 4,     null: false
    t.text     "name",       limit: 65535, null: false
    t.text     "value",      limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "tbldomainsadditionalfields", ["domainid"], name: "domainid", using: :btree

  create_table "tbldownloadcats", force: :cascade do |t|
    t.integer  "parentid",    limit: 4,     default: 0, null: false
    t.text     "name",        limit: 65535,             null: false
    t.text     "description", limit: 65535,             null: false
    t.boolean  "hidden",                                null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "tbldownloadcats", ["parentid"], name: "parentid", using: :btree

  create_table "tbldownloads", force: :cascade do |t|
    t.integer  "category",        limit: 4,                 null: false
    t.text     "type",            limit: 65535,             null: false
    t.text     "title",           limit: 65535,             null: false
    t.text     "description",     limit: 65535,             null: false
    t.integer  "downloads",       limit: 4,     default: 0, null: false
    t.text     "location",        limit: 65535,             null: false
    t.boolean  "clientsonly",                               null: false
    t.boolean  "hidden",                                    null: false
    t.boolean  "productdownload",                           null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "tbldownloads", ["downloads"], name: "downloads", using: :btree
  add_index "tbldownloads", ["title"], name: "title", length: {"title"=>32}, using: :btree

  create_table "tblemailmarketer", force: :cascade do |t|
    t.text    "name",      limit: 65535, null: false
    t.text    "type",      limit: 65535, null: false
    t.text    "settings",  limit: 65535, null: false
    t.integer "disable",   limit: 4,     null: false
    t.integer "marketing", limit: 4,     null: false
  end

  create_table "tblemails", force: :cascade do |t|
    t.integer  "userid",  limit: 4,     null: false
    t.text     "subject", limit: 65535, null: false
    t.text     "message", limit: 65535, null: false
    t.datetime "date"
    t.text     "to",      limit: 65535
    t.text     "cc",      limit: 65535
    t.text     "bcc",     limit: 65535
  end

  add_index "tblemails", ["userid"], name: "userid", using: :btree

  create_table "tblemailtemplates", force: :cascade do |t|
    t.text     "type",        limit: 65535, null: false
    t.text     "name",        limit: 65535, null: false
    t.text     "subject",     limit: 65535, null: false
    t.text     "message",     limit: 65535, null: false
    t.text     "attachments", limit: 65535, null: false
    t.text     "fromname",    limit: 65535, null: false
    t.text     "fromemail",   limit: 65535, null: false
    t.boolean  "disabled",                  null: false
    t.boolean  "custom",                    null: false
    t.text     "language",    limit: 65535, null: false
    t.text     "copyto",      limit: 65535, null: false
    t.boolean  "plaintext",                 null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tblemailtemplates", ["name"], name: "name", length: {"name"=>64}, using: :btree
  add_index "tblemailtemplates", ["type"], name: "type", length: {"type"=>32}, using: :btree

  create_table "tblfraud", force: :cascade do |t|
    t.text "fraud",   limit: 65535, null: false
    t.text "setting", limit: 65535, null: false
    t.text "value",   limit: 65535, null: false
  end

  add_index "tblfraud", ["fraud"], name: "fraud", length: {"fraud"=>32}, using: :btree

  create_table "tblgatewaylog", force: :cascade do |t|
    t.datetime "date",                  null: false
    t.text     "gateway", limit: 65535, null: false
    t.text     "data",    limit: 65535, null: false
    t.text     "result",  limit: 65535, null: false
  end

  create_table "tblhosting", force: :cascade do |t|
    t.integer  "userid",              limit: 4,                                            null: false
    t.integer  "orderid",             limit: 4,                                            null: false
    t.integer  "packageid",           limit: 4,                                            null: false
    t.integer  "server",              limit: 4,                                            null: false
    t.date     "regdate",                                                                  null: false
    t.text     "domain",              limit: 65535,                                        null: false
    t.text     "paymentmethod",       limit: 65535,                                        null: false
    t.decimal  "firstpaymentamount",                precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "amount",                            precision: 10, scale: 2, default: 0.0, null: false
    t.text     "billingcycle",        limit: 65535,                                        null: false
    t.date     "nextduedate"
    t.date     "nextinvoicedate",                                                          null: false
    t.date     "termination_date",                                                         null: false
    t.string   "domainstatus",        limit: 10,                                           null: false
    t.text     "username",            limit: 65535,                                        null: false
    t.text     "password",            limit: 65535,                                        null: false
    t.text     "notes",               limit: 65535,                                        null: false
    t.text     "subscriptionid",      limit: 65535,                                        null: false
    t.integer  "promoid",             limit: 4,                                            null: false
    t.text     "suspendreason",       limit: 65535,                                        null: false
    t.boolean  "overideautosuspend",                                                       null: false
    t.date     "overidesuspenduntil",                                                      null: false
    t.text     "dedicatedip",         limit: 65535,                                        null: false
    t.text     "assignedips",         limit: 65535,                                        null: false
    t.text     "ns1",                 limit: 65535,                                        null: false
    t.text     "ns2",                 limit: 65535,                                        null: false
    t.integer  "diskusage",           limit: 4,                              default: 0,   null: false
    t.integer  "disklimit",           limit: 4,                              default: 0,   null: false
    t.integer  "bwusage",             limit: 4,                              default: 0,   null: false
    t.integer  "bwlimit",             limit: 4,                              default: 0,   null: false
    t.datetime "lastupdate",                                                               null: false
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
  end

  add_index "tblhosting", ["domain"], name: "domain", length: {"domain"=>64}, using: :btree
  add_index "tblhosting", ["domainstatus"], name: "domainstatus", using: :btree
  add_index "tblhosting", ["id"], name: "serviceid", using: :btree
  add_index "tblhosting", ["orderid"], name: "orderid", using: :btree
  add_index "tblhosting", ["packageid"], name: "productid", using: :btree
  add_index "tblhosting", ["server"], name: "serverid", using: :btree
  add_index "tblhosting", ["userid"], name: "userid", using: :btree

  create_table "tblhostingaddons", force: :cascade do |t|
    t.integer  "orderid",          limit: 4,                                                  null: false
    t.integer  "hostingid",        limit: 4,                                                  null: false
    t.integer  "addonid",          limit: 4,                                                  null: false
    t.text     "name",             limit: 65535,                                              null: false
    t.decimal  "setupfee",                       precision: 10, scale: 2, default: 0.0,       null: false
    t.decimal  "recurring",                      precision: 10, scale: 2, default: 0.0,       null: false
    t.text     "billingcycle",     limit: 65535,                                              null: false
    t.text     "tax",              limit: 65535,                                              null: false
    t.string   "status",           limit: 10,                             default: "Pending", null: false
    t.date     "regdate",                                                                     null: false
    t.date     "nextduedate"
    t.date     "nextinvoicedate",                                                             null: false
    t.date     "termination_date",                                                            null: false
    t.text     "paymentmethod",    limit: 65535,                                              null: false
    t.text     "notes",            limit: 65535,                                              null: false
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
  end

  add_index "tblhostingaddons", ["hostingid"], name: "serviceid", using: :btree
  add_index "tblhostingaddons", ["name"], name: "name", length: {"name"=>32}, using: :btree
  add_index "tblhostingaddons", ["orderid"], name: "orderid", using: :btree
  add_index "tblhostingaddons", ["status"], name: "status", using: :btree

  create_table "tblhostingconfigoptions", force: :cascade do |t|
    t.integer "relid",    limit: 4, null: false
    t.integer "configid", limit: 4, null: false
    t.integer "optionid", limit: 4, null: false
    t.integer "qty",      limit: 4, null: false
  end

  add_index "tblhostingconfigoptions", ["relid", "configid"], name: "relid_configid", using: :btree

  create_table "tblinvoiceitems", force: :cascade do |t|
    t.integer "invoiceid",     limit: 4,                              default: 0,   null: false
    t.integer "userid",        limit: 4,                                            null: false
    t.string  "type",          limit: 30,                                           null: false
    t.integer "relid",         limit: 4,                                            null: false
    t.text    "description",   limit: 65535,                                        null: false
    t.decimal "amount",                      precision: 10, scale: 2, default: 0.0, null: false
    t.integer "taxed",         limit: 4,                                            null: false
    t.date    "duedate"
    t.text    "paymentmethod", limit: 65535,                                        null: false
    t.text    "notes",         limit: 65535,                                        null: false
  end

  add_index "tblinvoiceitems", ["invoiceid"], name: "invoiceid", using: :btree
  add_index "tblinvoiceitems", ["userid", "type", "relid"], name: "userid", using: :btree

  create_table "tblinvoices", force: :cascade do |t|
    t.integer  "userid",        limit: 4,                              default: 0,   null: false
    t.text     "invoicenum",    limit: 65535,                                        null: false
    t.date     "date"
    t.date     "duedate"
    t.datetime "datepaid",                                                           null: false
    t.decimal  "subtotal",                    precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "credit",                      precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "tax",                         precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "tax2",                        precision: 10, scale: 2,               null: false
    t.decimal  "total",                       precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "taxrate",                     precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "taxrate2",                    precision: 10, scale: 2,               null: false
    t.text     "status",        limit: 65535,                                        null: false
    t.text     "paymentmethod", limit: 65535,                                        null: false
    t.text     "notes",         limit: 65535,                                        null: false
    t.integer  "fullcredit",    limit: 4,                              default: 0,   null: false
  end

  add_index "tblinvoices", ["status"], name: "status", length: {"status"=>3}, using: :btree
  add_index "tblinvoices", ["userid"], name: "userid", using: :btree

  create_table "tblknowledgebase", force: :cascade do |t|
    t.text    "title",    limit: 65535,             null: false
    t.text    "article",  limit: 65535,             null: false
    t.integer "views",    limit: 4,     default: 0, null: false
    t.integer "useful",   limit: 4,     default: 0, null: false
    t.integer "votes",    limit: 4,     default: 0, null: false
    t.text    "private",  limit: 65535,             null: false
    t.integer "order",    limit: 4,                 null: false
    t.integer "parentid", limit: 4,                 null: false
    t.text    "language", limit: 65535,             null: false
  end

  create_table "tblknowledgebasecats", force: :cascade do |t|
    t.integer "parentid",    limit: 4,     default: 0, null: false
    t.text    "name",        limit: 65535,             null: false
    t.text    "description", limit: 65535,             null: false
    t.text    "hidden",      limit: 65535,             null: false
    t.integer "catid",       limit: 4,                 null: false
    t.text    "language",    limit: 65535,             null: false
  end

  add_index "tblknowledgebasecats", ["name"], name: "name", length: {"name"=>64}, using: :btree
  add_index "tblknowledgebasecats", ["parentid"], name: "parentid", using: :btree

  create_table "tblknowledgebaselinks", id: false, force: :cascade do |t|
    t.integer "categoryid", limit: 4, null: false
    t.integer "articleid",  limit: 4, null: false
  end

  create_table "tblknowledgebasetags", force: :cascade do |t|
    t.integer "articleid", limit: 4,  null: false
    t.string  "tag",       limit: 64, null: false
  end

  create_table "tbllinks", force: :cascade do |t|
    t.text    "name",        limit: 65535, null: false
    t.text    "link",        limit: 65535, null: false
    t.integer "clicks",      limit: 4,     null: false
    t.integer "conversions", limit: 4,     null: false
  end

  add_index "tbllinks", ["name"], name: "name", length: {"name"=>64}, using: :btree

  create_table "tblmodulelog", force: :cascade do |t|
    t.datetime "date",                   null: false
    t.text     "module",   limit: 65535, null: false
    t.text     "action",   limit: 65535, null: false
    t.text     "request",  limit: 65535, null: false
    t.text     "response", limit: 65535, null: false
    t.text     "arrdata",  limit: 65535, null: false
  end

  create_table "tblnetworkissues", force: :cascade do |t|
    t.string   "title",       limit: 45,    null: false
    t.text     "description", limit: 65535, null: false
    t.string   "type",        limit: 6,     null: false
    t.string   "affecting",   limit: 100
    t.integer  "server",      limit: 4
    t.string   "priority",    limit: 8,     null: false
    t.datetime "startdate",                 null: false
    t.datetime "enddate"
    t.string   "status",      limit: 13,    null: false
    t.datetime "lastupdate",                null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tblnotes", force: :cascade do |t|
    t.integer  "userid",   limit: 4,                 null: false
    t.integer  "adminid",  limit: 4,     default: 0, null: false
    t.datetime "created",                            null: false
    t.datetime "modified",                           null: false
    t.text     "note",     limit: 65535,             null: false
    t.integer  "sticky",   limit: 4,                 null: false
  end

  add_index "tblnotes", ["userid"], name: "userid", using: :btree

  create_table "tbloauthserver_access_token_scopes", id: false, force: :cascade do |t|
    t.integer "access_token_id", limit: 4, default: 0, null: false
    t.integer "scope_id",        limit: 4, default: 0, null: false
  end

  add_index "tbloauthserver_access_token_scopes", ["access_token_id", "scope_id"], name: "tbloauthserver_access_token_scopes_scope_id_index", using: :btree

  create_table "tbloauthserver_access_tokens", force: :cascade do |t|
    t.string   "access_token", limit: 80,                null: false
    t.string   "client_id",    limit: 80,   default: "", null: false
    t.string   "user_id",      limit: 255,  default: "", null: false
    t.string   "redirect_uri", limit: 2000, default: "", null: false
    t.datetime "expires",                                null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "tbloauthserver_access_tokens", ["access_token"], name: "tbloauthserver_access_tokens_access_token_unique", unique: true, using: :btree

  create_table "tbloauthserver_auth_codes", force: :cascade do |t|
    t.string   "authorization_code", limit: 80,                null: false
    t.string   "client_id",          limit: 80,   default: "", null: false
    t.string   "user_id",            limit: 255,  default: "", null: false
    t.string   "redirect_uri",       limit: 2000, default: "", null: false
    t.string   "id_token",           limit: 2000, default: "", null: false
    t.datetime "expires",                                      null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "tbloauthserver_auth_codes", ["authorization_code"], name: "tbloauthserver_auth_codes_authorization_code_unique", unique: true, using: :btree

  create_table "tbloauthserver_authcode_scopes", id: false, force: :cascade do |t|
    t.integer "authorization_code_id", limit: 4, default: 0, null: false
    t.integer "scope_id",              limit: 4, default: 0, null: false
  end

  add_index "tbloauthserver_authcode_scopes", ["authorization_code_id", "scope_id"], name: "tbloauthserver_authcode_scopes_scope_id_index", using: :btree

  create_table "tbloauthserver_client_scopes", id: false, force: :cascade do |t|
    t.integer "client_id", limit: 4, default: 0, null: false
    t.integer "scope_id",  limit: 4, default: 0, null: false
  end

  add_index "tbloauthserver_client_scopes", ["client_id", "scope_id"], name: "tbloauthserver_client_scopes_scope_id_index", using: :btree

  create_table "tbloauthserver_clients", force: :cascade do |t|
    t.string   "identifier",      limit: 80,                null: false
    t.string   "secret",          limit: 255,  default: "", null: false
    t.string   "redirect_uri",    limit: 2000, default: "", null: false
    t.string   "grant_types",     limit: 80,   default: "", null: false
    t.string   "user_id",         limit: 255,  default: "", null: false
    t.integer  "service_id",      limit: 4,    default: 0,  null: false
    t.string   "name",            limit: 255,  default: "", null: false
    t.string   "description",     limit: 255,  default: "", null: false
    t.string   "logo_uri",        limit: 255,  default: "", null: false
    t.integer  "rsa_key_pair_id", limit: 4,    default: 0,  null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "tbloauthserver_clients", ["identifier"], name: "tbloauthserver_clients_identifier_unique", unique: true, using: :btree

  create_table "tbloauthserver_scopes", force: :cascade do |t|
    t.string   "scope",       limit: 80,               null: false
    t.string   "description", limit: 255, default: "", null: false
    t.integer  "is_default",  limit: 1,   default: 0,  null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "tbloauthserver_scopes", ["scope"], name: "tbloauthserver_scopes_scope_unique", unique: true, using: :btree

  create_table "tbloauthserver_user_authz", force: :cascade do |t|
    t.string   "user_id",    limit: 255, default: "", null: false
    t.integer  "client_id",  limit: 4,   default: 0,  null: false
    t.datetime "expires",                             null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "tbloauthserver_user_authz_scopes", id: false, force: :cascade do |t|
    t.integer "user_authz_id", limit: 4, default: 0, null: false
    t.integer "scope_id",      limit: 4, default: 0, null: false
  end

  add_index "tbloauthserver_user_authz_scopes", ["user_authz_id", "scope_id"], name: "tbloauthserver_user_authz_scopes_scope_id_index", using: :btree

  create_table "tblorders", force: :cascade do |t|
    t.integer  "ordernum",       limit: 8,                                          null: false
    t.integer  "userid",         limit: 4,                                          null: false
    t.integer  "contactid",      limit: 4,                                          null: false
    t.datetime "date",                                                              null: false
    t.text     "nameservers",    limit: 65535,                                      null: false
    t.text     "transfersecret", limit: 65535,                                      null: false
    t.text     "renewals",       limit: 65535,                                      null: false
    t.text     "promocode",      limit: 65535,                                      null: false
    t.text     "promotype",      limit: 65535,                                      null: false
    t.text     "promovalue",     limit: 65535,                                      null: false
    t.text     "orderdata",      limit: 65535,                                      null: false
    t.decimal  "amount",                       precision: 10, scale: 2,             null: false
    t.text     "paymentmethod",  limit: 65535,                                      null: false
    t.integer  "invoiceid",      limit: 4,                              default: 0, null: false
    t.text     "status",         limit: 65535,                                      null: false
    t.text     "ipaddress",      limit: 65535,                                      null: false
    t.text     "fraudmodule",    limit: 65535,                                      null: false
    t.text     "fraudoutput",    limit: 65535,                                      null: false
    t.text     "notes",          limit: 65535,                                      null: false
  end

  add_index "tblorders", ["contactid"], name: "contactid", using: :btree
  add_index "tblorders", ["date"], name: "date", using: :btree
  add_index "tblorders", ["ordernum"], name: "ordernum", using: :btree
  add_index "tblorders", ["userid"], name: "userid", using: :btree

  create_table "tblorderstatuses", force: :cascade do |t|
    t.text    "title",         limit: 65535, null: false
    t.text    "color",         limit: 65535, null: false
    t.integer "showpending",   limit: 4,     null: false
    t.integer "showactive",    limit: 4,     null: false
    t.integer "showcancelled", limit: 4,     null: false
    t.integer "sortorder",     limit: 4,     null: false
  end

  create_table "tblpaymentgateways", id: false, force: :cascade do |t|
    t.text    "gateway", limit: 65535, null: false
    t.text    "setting", limit: 65535, null: false
    t.text    "value",   limit: 65535, null: false
    t.integer "order",   limit: 4,     null: false
  end

  add_index "tblpaymentgateways", ["gateway", "setting"], name: "gateway_setting", length: {"gateway"=>32, "setting"=>32}, using: :btree
  add_index "tblpaymentgateways", ["setting", "value"], name: "setting_value", length: {"setting"=>32, "value"=>32}, using: :btree

  create_table "tblpricing", force: :cascade do |t|
    t.string  "type",         limit: 14,                          null: false
    t.integer "currency",     limit: 4,                           null: false
    t.integer "relid",        limit: 4,                           null: false
    t.decimal "msetupfee",               precision: 10, scale: 2, null: false
    t.decimal "qsetupfee",               precision: 10, scale: 2, null: false
    t.decimal "ssetupfee",               precision: 10, scale: 2, null: false
    t.decimal "asetupfee",               precision: 10, scale: 2, null: false
    t.decimal "bsetupfee",               precision: 10, scale: 2, null: false
    t.decimal "tsetupfee",               precision: 10, scale: 2, null: false
    t.decimal "monthly",                 precision: 10, scale: 2, null: false
    t.decimal "quarterly",               precision: 10, scale: 2, null: false
    t.decimal "semiannually",            precision: 10, scale: 2, null: false
    t.decimal "annually",                precision: 10, scale: 2, null: false
    t.decimal "biennially",              precision: 10, scale: 2, null: false
    t.decimal "triennially",             precision: 10, scale: 2, null: false
  end

  create_table "tblproduct_downloads", force: :cascade do |t|
    t.integer  "product_id",  limit: 4, null: false
    t.integer  "download_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "tblproduct_downloads", ["download_id"], name: "tblproduct_downloads_download_id_index", using: :btree
  add_index "tblproduct_downloads", ["product_id"], name: "tblproduct_downloads_product_id_index", using: :btree

  create_table "tblproduct_group_features", force: :cascade do |t|
    t.integer  "product_group_id", limit: 4,                 null: false
    t.text     "feature",          limit: 65535,             null: false
    t.integer  "order",            limit: 4,     default: 0, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "tblproduct_group_features", ["id", "product_group_id"], name: "tblproduct_group_features_id_product_group_id_index", using: :btree
  add_index "tblproduct_group_features", ["product_group_id"], name: "tblproduct_group_features_product_group_id_index", using: :btree

  create_table "tblproduct_upgrade_products", force: :cascade do |t|
    t.integer  "product_id",         limit: 4, null: false
    t.integer  "upgrade_product_id", limit: 4, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "tblproduct_upgrade_products", ["product_id"], name: "tblproduct_upgrade_products_product_id_index", using: :btree
  add_index "tblproduct_upgrade_products", ["upgrade_product_id"], name: "tblproduct_upgrade_products_upgrade_product_id_index", using: :btree

  create_table "tblproductconfiggroups", force: :cascade do |t|
    t.text "name",        limit: 65535, null: false
    t.text "description", limit: 65535, null: false
  end

  create_table "tblproductconfiglinks", id: false, force: :cascade do |t|
    t.integer "gid", limit: 4, null: false
    t.integer "pid", limit: 4, null: false
  end

  create_table "tblproductconfigoptions", force: :cascade do |t|
    t.integer "gid",        limit: 4,     default: 0, null: false
    t.text    "optionname", limit: 65535,             null: false
    t.text    "optiontype", limit: 65535,             null: false
    t.integer "qtyminimum", limit: 4,                 null: false
    t.integer "qtymaximum", limit: 4,                 null: false
    t.integer "order",      limit: 4,     default: 0, null: false
    t.integer "hidden",     limit: 4,                 null: false
  end

  add_index "tblproductconfigoptions", ["gid"], name: "productid", using: :btree

  create_table "tblproductconfigoptionssub", force: :cascade do |t|
    t.integer "configid",   limit: 4,                 null: false
    t.text    "optionname", limit: 65535,             null: false
    t.integer "sortorder",  limit: 4,     default: 0, null: false
    t.integer "hidden",     limit: 4,                 null: false
  end

  add_index "tblproductconfigoptionssub", ["configid"], name: "configid", using: :btree

  create_table "tblproductgroups", force: :cascade do |t|
    t.text     "name",             limit: 65535,             null: false
    t.text     "headline",         limit: 65535
    t.text     "tagline",          limit: 65535
    t.text     "orderfrmtpl",      limit: 65535,             null: false
    t.text     "disabledgateways", limit: 65535,             null: false
    t.boolean  "hidden",                                     null: false
    t.integer  "order",            limit: 4,     default: 0, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "tblproductgroups", ["order"], name: "order", using: :btree

  create_table "tblproducts", force: :cascade do |t|
    t.text     "type",                   limit: 65535,                                      null: false
    t.integer  "gid",                    limit: 4,                                          null: false
    t.text     "name",                   limit: 65535,                                      null: false
    t.text     "description",            limit: 65535,                                      null: false
    t.boolean  "hidden",                                                                    null: false
    t.boolean  "showdomainoptions",                                                         null: false
    t.integer  "welcomeemail",           limit: 4,                              default: 0, null: false
    t.boolean  "stockcontrol",                                                              null: false
    t.integer  "qty",                    limit: 4,                              default: 0, null: false
    t.boolean  "proratabilling",                                                            null: false
    t.integer  "proratadate",            limit: 4,                                          null: false
    t.integer  "proratachargenextmonth", limit: 4,                                          null: false
    t.text     "paytype",                limit: 65535,                                      null: false
    t.integer  "allowqty",               limit: 4,                                          null: false
    t.text     "subdomain",              limit: 65535,                                      null: false
    t.text     "autosetup",              limit: 65535,                                      null: false
    t.text     "servertype",             limit: 65535,                                      null: false
    t.integer  "servergroup",            limit: 4,                                          null: false
    t.text     "configoption1",          limit: 65535,                                      null: false
    t.text     "configoption2",          limit: 65535,                                      null: false
    t.text     "configoption3",          limit: 65535,                                      null: false
    t.text     "configoption4",          limit: 65535,                                      null: false
    t.text     "configoption5",          limit: 65535,                                      null: false
    t.text     "configoption6",          limit: 65535,                                      null: false
    t.text     "configoption7",          limit: 65535,                                      null: false
    t.text     "configoption8",          limit: 65535,                                      null: false
    t.text     "configoption9",          limit: 65535,                                      null: false
    t.text     "configoption10",         limit: 65535,                                      null: false
    t.text     "configoption11",         limit: 65535,                                      null: false
    t.text     "configoption12",         limit: 65535,                                      null: false
    t.text     "configoption13",         limit: 65535,                                      null: false
    t.text     "configoption14",         limit: 65535,                                      null: false
    t.text     "configoption15",         limit: 65535,                                      null: false
    t.text     "configoption16",         limit: 65535,                                      null: false
    t.text     "configoption17",         limit: 65535,                                      null: false
    t.text     "configoption18",         limit: 65535,                                      null: false
    t.text     "configoption19",         limit: 65535,                                      null: false
    t.text     "configoption20",         limit: 65535,                                      null: false
    t.text     "configoption21",         limit: 65535,                                      null: false
    t.text     "configoption22",         limit: 65535,                                      null: false
    t.text     "configoption23",         limit: 65535,                                      null: false
    t.text     "configoption24",         limit: 65535,                                      null: false
    t.text     "freedomain",             limit: 65535,                                      null: false
    t.text     "freedomainpaymentterms", limit: 65535,                                      null: false
    t.text     "freedomaintlds",         limit: 65535,                                      null: false
    t.integer  "recurringcycles",        limit: 4,                                          null: false
    t.integer  "autoterminatedays",      limit: 4,                                          null: false
    t.integer  "autoterminateemail",     limit: 4,                              default: 0, null: false
    t.boolean  "configoptionsupgrade",                                                      null: false
    t.text     "billingcycleupgrade",    limit: 65535,                                      null: false
    t.integer  "upgradeemail",           limit: 4,                              default: 0, null: false
    t.string   "overagesenabled",        limit: 10,                                         null: false
    t.integer  "overagesdisklimit",      limit: 4,                                          null: false
    t.integer  "overagesbwlimit",        limit: 4,                                          null: false
    t.decimal  "overagesdiskprice",                    precision: 6,  scale: 4,             null: false
    t.decimal  "overagesbwprice",                      precision: 6,  scale: 4,             null: false
    t.boolean  "tax",                                                                       null: false
    t.boolean  "affiliateonetime",                                                          null: false
    t.text     "affiliatepaytype",       limit: 65535,                                      null: false
    t.decimal  "affiliatepayamount",                   precision: 10, scale: 2,             null: false
    t.integer  "order",                  limit: 4,                              default: 0, null: false
    t.boolean  "retired",                                                                   null: false
    t.boolean  "is_featured",                                                               null: false
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
  end

  add_index "tblproducts", ["gid"], name: "gid", using: :btree
  add_index "tblproducts", ["name"], name: "name", length: {"name"=>64}, using: :btree

  create_table "tblpromotions", force: :cascade do |t|
    t.text    "code",             limit: 65535,                                        null: false
    t.text    "type",             limit: 65535,                                        null: false
    t.integer "recurring",        limit: 4
    t.decimal "value",                          precision: 10, scale: 2, default: 0.0, null: false
    t.text    "cycles",           limit: 65535,                                        null: false
    t.text    "appliesto",        limit: 65535,                                        null: false
    t.text    "requires",         limit: 65535,                                        null: false
    t.integer "requiresexisting", limit: 4,                                            null: false
    t.date    "startdate",                                                             null: false
    t.date    "expirationdate"
    t.integer "maxuses",          limit: 4,                              default: 0,   null: false
    t.integer "uses",             limit: 4,                              default: 0,   null: false
    t.integer "lifetimepromo",    limit: 4,                                            null: false
    t.integer "applyonce",        limit: 4,                                            null: false
    t.integer "newsignups",       limit: 4,                                            null: false
    t.integer "existingclient",   limit: 4,                                            null: false
    t.integer "onceperclient",    limit: 4,                                            null: false
    t.integer "recurfor",         limit: 4,                                            null: false
    t.integer "upgrades",         limit: 4,                                            null: false
    t.text    "upgradeconfig",    limit: 65535,                                        null: false
    t.text    "notes",            limit: 65535,                                        null: false
  end

  add_index "tblpromotions", ["code"], name: "code", length: {"code"=>32}, using: :btree

  create_table "tblquoteitems", force: :cascade do |t|
    t.integer  "quoteid",     limit: 4,                              null: false
    t.text     "description", limit: 65535,                          null: false
    t.text     "quantity",    limit: 65535,                          null: false
    t.decimal  "unitprice",                 precision: 10, scale: 2, null: false
    t.decimal  "discount",                  precision: 10, scale: 2, null: false
    t.integer  "taxable",     limit: 4,                              null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "tblquotes", force: :cascade do |t|
    t.text    "subject",       limit: 65535,                          null: false
    t.string  "stage",         limit: 9,                              null: false
    t.date    "validuntil",                                           null: false
    t.integer "userid",        limit: 4,                              null: false
    t.text    "firstname",     limit: 65535,                          null: false
    t.text    "lastname",      limit: 65535,                          null: false
    t.text    "companyname",   limit: 65535,                          null: false
    t.text    "email",         limit: 65535,                          null: false
    t.text    "address1",      limit: 65535,                          null: false
    t.text    "address2",      limit: 65535,                          null: false
    t.text    "city",          limit: 65535,                          null: false
    t.text    "state",         limit: 65535,                          null: false
    t.text    "postcode",      limit: 65535,                          null: false
    t.text    "country",       limit: 65535,                          null: false
    t.text    "phonenumber",   limit: 65535,                          null: false
    t.integer "currency",      limit: 4,                              null: false
    t.decimal "subtotal",                    precision: 10, scale: 2, null: false
    t.decimal "tax1",                        precision: 10, scale: 2, null: false
    t.decimal "tax2",                        precision: 10, scale: 2, null: false
    t.decimal "total",                       precision: 10, scale: 2, null: false
    t.text    "proposal",      limit: 65535,                          null: false
    t.text    "customernotes", limit: 65535,                          null: false
    t.text    "adminnotes",    limit: 65535,                          null: false
    t.date    "datecreated",                                          null: false
    t.date    "lastmodified",                                         null: false
    t.date    "datesent",                                             null: false
    t.date    "dateaccepted",                                         null: false
  end

  create_table "tblregistrars", force: :cascade do |t|
    t.text "registrar", limit: 65535, null: false
    t.text "setting",   limit: 65535, null: false
    t.text "value",     limit: 65535, null: false
  end

  add_index "tblregistrars", ["registrar", "setting"], name: "registrar_setting", length: {"registrar"=>32, "setting"=>32}, using: :btree

  create_table "tblrsakeypairs", force: :cascade do |t|
    t.string   "identifier",  limit: 96,    default: "",      null: false
    t.text     "private_key", limit: 65535,                   null: false
    t.text     "public_key",  limit: 65535,                   null: false
    t.string   "algorithm",   limit: 16,    default: "RS256", null: false
    t.string   "name",        limit: 255,   default: "",      null: false
    t.string   "description", limit: 255,   default: "",      null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "tblservergroups", force: :cascade do |t|
    t.text    "name",     limit: 65535, null: false
    t.integer "filltype", limit: 4,     null: false
  end

  create_table "tblservergroupsrel", id: false, force: :cascade do |t|
    t.integer "groupid",  limit: 4, null: false
    t.integer "serverid", limit: 4, null: false
  end

  create_table "tblservers", force: :cascade do |t|
    t.text    "name",          limit: 65535,                                        null: false
    t.text    "ipaddress",     limit: 65535,                                        null: false
    t.text    "assignedips",   limit: 65535,                                        null: false
    t.text    "hostname",      limit: 65535,                                        null: false
    t.decimal "monthlycost",                 precision: 10, scale: 2, default: 0.0, null: false
    t.text    "noc",           limit: 65535,                                        null: false
    t.text    "statusaddress", limit: 65535,                                        null: false
    t.text    "nameserver1",   limit: 65535,                                        null: false
    t.text    "nameserver1ip", limit: 65535,                                        null: false
    t.text    "nameserver2",   limit: 65535,                                        null: false
    t.text    "nameserver2ip", limit: 65535,                                        null: false
    t.text    "nameserver3",   limit: 65535,                                        null: false
    t.text    "nameserver3ip", limit: 65535,                                        null: false
    t.text    "nameserver4",   limit: 65535,                                        null: false
    t.text    "nameserver4ip", limit: 65535,                                        null: false
    t.text    "nameserver5",   limit: 65535,                                        null: false
    t.text    "nameserver5ip", limit: 65535,                                        null: false
    t.integer "maxaccounts",   limit: 4,                              default: 0,   null: false
    t.text    "type",          limit: 65535,                                        null: false
    t.text    "username",      limit: 65535,                                        null: false
    t.text    "password",      limit: 65535,                                        null: false
    t.text    "accesshash",    limit: 65535,                                        null: false
    t.text    "secure",        limit: 65535,                                        null: false
    t.integer "port",          limit: 4
    t.integer "active",        limit: 4,                                            null: false
    t.integer "disabled",      limit: 4,                                            null: false
  end

  create_table "tblserversssoperms", force: :cascade do |t|
    t.integer "server_id", limit: 4, null: false
    t.integer "role_id",   limit: 4, null: false
  end

  create_table "tblsslorders", force: :cascade do |t|
    t.integer  "userid",         limit: 4,     null: false
    t.integer  "serviceid",      limit: 4,     null: false
    t.text     "remoteid",       limit: 65535, null: false
    t.text     "module",         limit: 65535, null: false
    t.text     "certtype",       limit: 65535, null: false
    t.text     "configdata",     limit: 65535, null: false
    t.datetime "completiondate",               null: false
    t.text     "status",         limit: 65535, null: false
  end

  create_table "tbltax", force: :cascade do |t|
    t.integer "level",   limit: 4,                              null: false
    t.text    "name",    limit: 65535,                          null: false
    t.text    "state",   limit: 65535,                          null: false
    t.text    "country", limit: 65535,                          null: false
    t.decimal "taxrate",               precision: 10, scale: 2, null: false
  end

  add_index "tbltax", ["state", "country"], name: "state_country", length: {"state"=>32, "country"=>2}, using: :btree

  create_table "tblticketbreaklines", force: :cascade do |t|
    t.text "breakline", limit: 65535, null: false
  end

  create_table "tblticketdepartments", force: :cascade do |t|
    t.text    "name",            limit: 65535, null: false
    t.text    "description",     limit: 65535, null: false
    t.text    "email",           limit: 65535, null: false
    t.text    "clientsonly",     limit: 65535, null: false
    t.text    "piperepliesonly", limit: 65535, null: false
    t.text    "noautoresponder", limit: 65535, null: false
    t.text    "hidden",          limit: 65535, null: false
    t.integer "order",           limit: 4,     null: false
    t.text    "host",            limit: 65535, null: false
    t.text    "port",            limit: 65535, null: false
    t.text    "login",           limit: 65535, null: false
    t.text    "password",        limit: 65535, null: false
  end

  add_index "tblticketdepartments", ["name"], name: "name", length: {"name"=>64}, using: :btree

  create_table "tblticketescalations", force: :cascade do |t|
    t.text    "name",          limit: 65535, null: false
    t.text    "departments",   limit: 65535, null: false
    t.text    "statuses",      limit: 65535, null: false
    t.text    "priorities",    limit: 65535, null: false
    t.integer "timeelapsed",   limit: 4,     null: false
    t.text    "newdepartment", limit: 65535, null: false
    t.text    "newpriority",   limit: 65535, null: false
    t.text    "newstatus",     limit: 65535, null: false
    t.text    "flagto",        limit: 65535, null: false
    t.text    "notify",        limit: 65535, null: false
    t.text    "addreply",      limit: 65535, null: false
  end

  create_table "tblticketfeedback", force: :cascade do |t|
    t.integer  "ticketid", limit: 4,     null: false
    t.integer  "adminid",  limit: 4,     null: false
    t.integer  "rating",   limit: 4,     null: false
    t.text     "comments", limit: 65535, null: false
    t.datetime "datetime",               null: false
    t.text     "ip",       limit: 65535, null: false
  end

  create_table "tblticketlog", force: :cascade do |t|
    t.datetime "date",                 null: false
    t.integer  "tid",    limit: 4,     null: false
    t.text     "action", limit: 65535, null: false
  end

  add_index "tblticketlog", ["tid"], name: "tid", using: :btree

  create_table "tblticketmaillog", force: :cascade do |t|
    t.datetime "date",                  null: false
    t.text     "to",      limit: 65535, null: false
    t.text     "name",    limit: 65535, null: false
    t.text     "email",   limit: 65535, null: false
    t.text     "subject", limit: 65535, null: false
    t.text     "message", limit: 65535, null: false
    t.text     "status",  limit: 65535, null: false
  end

  create_table "tblticketnotes", force: :cascade do |t|
    t.integer  "ticketid", limit: 4,     null: false
    t.text     "admin",    limit: 65535, null: false
    t.datetime "date",                   null: false
    t.text     "message",  limit: 65535, null: false
  end

  add_index "tblticketnotes", ["ticketid", "date"], name: "ticketid_date", using: :btree

  create_table "tblticketpredefinedcats", force: :cascade do |t|
    t.integer "parentid", limit: 4,     default: 0, null: false
    t.text    "name",     limit: 65535,             null: false
  end

  add_index "tblticketpredefinedcats", ["parentid", "name"], name: "parentid_name", length: {"parentid"=>nil, "name"=>64}, using: :btree

  create_table "tblticketpredefinedreplies", force: :cascade do |t|
    t.integer "catid", limit: 4,     null: false
    t.text    "name",  limit: 65535, null: false
    t.text    "reply", limit: 65535, null: false
  end

  create_table "tblticketreplies", force: :cascade do |t|
    t.integer  "tid",        limit: 4,     null: false
    t.integer  "userid",     limit: 4,     null: false
    t.integer  "contactid",  limit: 4,     null: false
    t.text     "name",       limit: 65535, null: false
    t.text     "email",      limit: 65535, null: false
    t.datetime "date",                     null: false
    t.text     "message",    limit: 65535, null: false
    t.text     "admin",      limit: 65535, null: false
    t.text     "attachment", limit: 65535, null: false
    t.integer  "rating",     limit: 4,     null: false
  end

  add_index "tblticketreplies", ["tid", "date"], name: "tid_date", using: :btree

  create_table "tbltickets", force: :cascade do |t|
    t.string   "tid",           limit: 128
    t.integer  "did",           limit: 4,     null: false
    t.integer  "userid",        limit: 4,     null: false
    t.integer  "contactid",     limit: 4,     null: false
    t.text     "name",          limit: 65535, null: false
    t.text     "email",         limit: 65535, null: false
    t.text     "cc",            limit: 65535, null: false
    t.text     "c",             limit: 65535, null: false
    t.datetime "date",                        null: false
    t.text     "title",         limit: 65535, null: false
    t.text     "message",       limit: 65535, null: false
    t.string   "status",        limit: 64,    null: false
    t.text     "urgency",       limit: 65535, null: false
    t.text     "admin",         limit: 65535, null: false
    t.text     "attachment",    limit: 65535, null: false
    t.datetime "lastreply",                   null: false
    t.integer  "flag",          limit: 4,     null: false
    t.integer  "clientunread",  limit: 4,     null: false
    t.text     "adminunread",   limit: 65535, null: false
    t.integer  "replyingadmin", limit: 4,     null: false
    t.datetime "replyingtime",                null: false
    t.text     "service",       limit: 65535, null: false
  end

  add_index "tbltickets", ["date"], name: "date", using: :btree
  add_index "tbltickets", ["did"], name: "did", using: :btree
  add_index "tbltickets", ["status"], name: "status", length: {"status"=>10}, using: :btree
  add_index "tbltickets", ["tid", "c"], name: "tid_c", length: {"tid"=>nil, "c"=>64}, using: :btree
  add_index "tbltickets", ["userid"], name: "userid", using: :btree

  create_table "tblticketspamfilters", force: :cascade do |t|
    t.string "type",    limit: 7,     null: false
    t.text   "content", limit: 65535, null: false
  end

  add_index "tblticketspamfilters", ["type"], name: "type", using: :btree

  create_table "tblticketstatuses", force: :cascade do |t|
    t.string  "title",        limit: 64,    null: false
    t.text    "color",        limit: 65535, null: false
    t.integer "sortorder",    limit: 4,     null: false
    t.integer "showactive",   limit: 4,     null: false
    t.integer "showawaiting", limit: 4,     null: false
    t.integer "autoclose",    limit: 4,     null: false
  end

  create_table "tbltickettags", force: :cascade do |t|
    t.integer "ticketid", limit: 4,     null: false
    t.text    "tag",      limit: 65535, null: false
  end

  create_table "tbltld_categories", force: :cascade do |t|
    t.string   "category",      limit: 255,                 null: false
    t.boolean  "is_primary",                default: false, null: false
    t.integer  "display_order", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "tbltld_category_pivot", force: :cascade do |t|
    t.integer  "tld_id",      limit: 4, null: false
    t.integer  "category_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "tbltld_category_pivot", ["category_id"], name: "tbltld_category_pivot_category_id_index", using: :btree
  add_index "tbltld_category_pivot", ["tld_id"], name: "tbltld_category_pivot_tld_id_index", using: :btree

  create_table "tbltlds", force: :cascade do |t|
    t.string   "tld",        limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tbltodolist", force: :cascade do |t|
    t.date    "date",                                  null: false
    t.text    "title",       limit: 65535,             null: false
    t.text    "description", limit: 65535,             null: false
    t.integer "admin",       limit: 4,     default: 0, null: false
    t.text    "status",      limit: 65535,             null: false
    t.date    "duedate",                               null: false
  end

  add_index "tbltodolist", ["duedate"], name: "duedate", using: :btree

  create_table "tbltransientdata", force: :cascade do |t|
    t.string  "name",    limit: 1024,  null: false
    t.text    "data",    limit: 65535, null: false
    t.integer "expires", limit: 4,     null: false
  end

  add_index "tbltransientdata", ["name"], name: "name", length: {"name"=>255}, using: :btree

  create_table "tblupdatehistory", force: :cascade do |t|
    t.integer  "admin_id",         limit: 4,     null: false
    t.string   "original_version", limit: 255,   null: false
    t.string   "new_version",      limit: 255,   null: false
    t.boolean  "success",                        null: false
    t.text     "message",          limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "tblupgrades", force: :cascade do |t|
    t.integer "orderid",         limit: 4,                                                  null: false
    t.text    "type",            limit: 65535,                                              null: false
    t.date    "date",                                                                       null: false
    t.integer "relid",           limit: 4,                                                  null: false
    t.text    "originalvalue",   limit: 65535,                                              null: false
    t.text    "newvalue",        limit: 65535,                                              null: false
    t.decimal "amount",                        precision: 10, scale: 2,                     null: false
    t.decimal "recurringchange",               precision: 10, scale: 2,                     null: false
    t.string  "status",          limit: 9,                              default: "Pending", null: false
    t.string  "paid",            limit: 1,                              default: "N",       null: false
  end

  add_index "tblupgrades", ["orderid"], name: "orderid", using: :btree
  add_index "tblupgrades", ["relid"], name: "serviceid", using: :btree

  create_table "tblwhoislog", force: :cascade do |t|
    t.datetime "date",                 null: false
    t.text     "domain", limit: 65535, null: false
    t.text     "ip",     limit: 65535, null: false
  end

end
