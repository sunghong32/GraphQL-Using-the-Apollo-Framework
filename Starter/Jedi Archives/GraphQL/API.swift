// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AllFilmsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AllFilms {
      allFilms {
        __typename
        films {
          __typename
          id
          director
          episodeID
          title
          releaseDate
          characterConnection(first: 10) {
            __typename
            characters {
              __typename
              id
              name
              birthYear
              eyeColor
              hairColor
              homeworld {
                __typename
                name
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "AllFilms"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allFilms", type: .object(AllFilm.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allFilms: AllFilm? = nil) {
      self.init(unsafeResultMap: ["__typename": "Root", "allFilms": allFilms.flatMap { (value: AllFilm) -> ResultMap in value.resultMap }])
    }

    public var allFilms: AllFilm? {
      get {
        return (resultMap["allFilms"] as? ResultMap).flatMap { AllFilm(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "allFilms")
      }
    }

    public struct AllFilm: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FilmsConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("films", type: .list(.object(Film.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(films: [Film?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "FilmsConnection", "films": films.flatMap { (value: [Film?]) -> [ResultMap?] in value.map { (value: Film?) -> ResultMap? in value.flatMap { (value: Film) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of all of the objects returned in the connection. This is a convenience
      /// field provided for quickly exploring the API; rather than querying for
      /// "{ edges { node } }" when no edge data is needed, this field can be be used
      /// instead. Note that when clients like Relay need to fetch the "cursor" field on
      /// the edge to enable efficient pagination, this shortcut cannot be used, and the
      /// full "{ edges { node } }" version should be used instead.
      public var films: [Film?]? {
        get {
          return (resultMap["films"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Film?] in value.map { (value: ResultMap?) -> Film? in value.flatMap { (value: ResultMap) -> Film in Film(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Film?]) -> [ResultMap?] in value.map { (value: Film?) -> ResultMap? in value.flatMap { (value: Film) -> ResultMap in value.resultMap } } }, forKey: "films")
        }
      }

      public struct Film: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Film"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("director", type: .scalar(String.self)),
            GraphQLField("episodeID", type: .scalar(Int.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("releaseDate", type: .scalar(String.self)),
            GraphQLField("characterConnection", arguments: ["first": 10], type: .object(CharacterConnection.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, director: String? = nil, episodeId: Int? = nil, title: String? = nil, releaseDate: String? = nil, characterConnection: CharacterConnection? = nil) {
          self.init(unsafeResultMap: ["__typename": "Film", "id": id, "director": director, "episodeID": episodeId, "title": title, "releaseDate": releaseDate, "characterConnection": characterConnection.flatMap { (value: CharacterConnection) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the director of this film.
        public var director: String? {
          get {
            return resultMap["director"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "director")
          }
        }

        /// The episode number of this film.
        public var episodeId: Int? {
          get {
            return resultMap["episodeID"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "episodeID")
          }
        }

        /// The title of this film.
        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        /// The ISO 8601 date format of film release at original creator country.
        public var releaseDate: String? {
          get {
            return resultMap["releaseDate"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "releaseDate")
          }
        }

        public var characterConnection: CharacterConnection? {
          get {
            return (resultMap["characterConnection"] as? ResultMap).flatMap { CharacterConnection(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "characterConnection")
          }
        }

        public struct CharacterConnection: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FilmCharactersConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("characters", type: .list(.object(Character.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(characters: [Character?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "FilmCharactersConnection", "characters": characters.flatMap { (value: [Character?]) -> [ResultMap?] in value.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of all of the objects returned in the connection. This is a convenience
          /// field provided for quickly exploring the API; rather than querying for
          /// "{ edges { node } }" when no edge data is needed, this field can be be used
          /// instead. Note that when clients like Relay need to fetch the "cursor" field on
          /// the edge to enable efficient pagination, this shortcut cannot be used, and the
          /// full "{ edges { node } }" version should be used instead.
          public var characters: [Character?]? {
            get {
              return (resultMap["characters"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Character?] in value.map { (value: ResultMap?) -> Character? in value.flatMap { (value: ResultMap) -> Character in Character(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Character?]) -> [ResultMap?] in value.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } } }, forKey: "characters")
            }
          }

          public struct Character: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Person"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("birthYear", type: .scalar(String.self)),
                GraphQLField("eyeColor", type: .scalar(String.self)),
                GraphQLField("hairColor", type: .scalar(String.self)),
                GraphQLField("homeworld", type: .object(Homeworld.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String? = nil, birthYear: String? = nil, eyeColor: String? = nil, hairColor: String? = nil, homeworld: Homeworld? = nil) {
              self.init(unsafeResultMap: ["__typename": "Person", "id": id, "name": name, "birthYear": birthYear, "eyeColor": eyeColor, "hairColor": hairColor, "homeworld": homeworld.flatMap { (value: Homeworld) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of an object
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The name of this person.
            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// The birth year of the person, using the in-universe standard of BBY or ABY -
            /// Before the Battle of Yavin or After the Battle of Yavin. The Battle of Yavin is
            /// a battle that occurs at the end of Star Wars episode IV: A New Hope.
            public var birthYear: String? {
              get {
                return resultMap["birthYear"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "birthYear")
              }
            }

            /// The eye color of this person. Will be "unknown" if not known or "n/a" if the
            /// person does not have an eye.
            public var eyeColor: String? {
              get {
                return resultMap["eyeColor"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "eyeColor")
              }
            }

            /// The hair color of this person. Will be "unknown" if not known or "n/a" if the
            /// person does not have hair.
            public var hairColor: String? {
              get {
                return resultMap["hairColor"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "hairColor")
              }
            }

            /// A planet that this person was born on or inhabits.
            public var homeworld: Homeworld? {
              get {
                return (resultMap["homeworld"] as? ResultMap).flatMap { Homeworld(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "homeworld")
              }
            }

            public struct Homeworld: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Planet"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Planet", "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The name of this planet.
              public var name: String? {
                get {
                  return resultMap["name"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }
          }
        }
      }
    }
  }
}
