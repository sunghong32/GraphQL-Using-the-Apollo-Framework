/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class FilmDetailsViewController: UITableViewController {
  private let film: AllFilmsQuery.Data.AllFilm.Film

  required init?(coder: NSCoder) {
    fatalError("init(coder:) is not implemented")
  }


  init?(film: AllFilmsQuery.Data.AllFilm.Film, coder: NSCoder) {
    self.film = film

    super.init(coder: coder)
  }

  @IBSegueAction func showCharacterDetails(_ coder: NSCoder, sender: Any?) -> CharacterDetailsViewController? {
    guard
      let cell = sender as? UITableViewCell,
      let indexPath = tableView.indexPath(for: cell),
      let character = film.characterConnection?.characters?[indexPath.row]
      else {
        return nil
    }

    return CharacterDetailsViewController(character: character, coder: coder)

  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = film.title
  }
}

extension FilmDetailsViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      // swiftlint:disable:next force_unwrapping
      let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell")!

        if indexPath.row == 0 {
          cell.textLabel?.text = "Episode"
          if let episodeNumber = film.episodeId {
            cell.detailTextLabel?.text = "\(episodeNumber)"
          }
        } else if indexPath.row == 1 {
          cell.textLabel?.text = "Released"
          cell.detailTextLabel?.text = film.releaseDate
        } else if indexPath.row == 2 {
          cell.textLabel?.text = "Director"
          cell.detailTextLabel?.text = film.director
        }
        
      return cell
    }
    // swiftlint:disable:next force_unwrapping
    let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell")!
    cell.textLabel?.text = film.characterConnection?.characters?[indexPath.row]?.name
    return cell
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 3
    }
    return film.characterConnection?.characters?.count ?? 0
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return section == 0 ? "Info" : "Characters"
  }
}
