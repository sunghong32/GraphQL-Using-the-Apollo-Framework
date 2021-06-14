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

class FilmsViewController: UITableViewController {
    var films: [AllFilmsQuery.Data.AllFilm.Film] = []

    @IBSegueAction func showFilmDetails(_ coder: NSCoder, sender: Any?) -> FilmDetailsViewController? {
        guard
          let cell = sender as? UITableViewCell,
          let indexPath = tableView.indexPath(for: cell)
          else {
            return nil
        }
        return FilmDetailsViewController(film: films[indexPath.row], coder: coder)
    }

  override func viewDidLoad() {
    super.viewDidLoad()

    loadData()
  }
}

extension FilmsViewController {
  func loadData() {
    // 1
    let query = AllFilmsQuery()
    // 2
    Apollo.shared.client.fetch(query: query) { result in
      // 3
      switch result {
      case .success(let graphQLResult):
        if let films = graphQLResult.data?.allFilms?.films?.compactMap({ $0 }) {
          // 4
          self.films = films
          self.tableView.reloadData()
        }

      case .failure(let error):
        // 5
        print("Error loading data \(error)")
      }
    }
  }
}

extension FilmsViewController {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // swiftlint:disable:next force_unwrapping
    let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell")!
    let film = films[indexPath.row]
    cell.textLabel?.text = film.title

    return cell
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return films.count
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Films"
  }
}
