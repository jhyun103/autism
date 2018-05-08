<app>

  <h1>Student Progress Tracker</h1>
  <p>Weekly Learn Unit Scores</p>
  <canvas ref="myChart" width="100%"></canvas>

  <br></br>
  <h3>Data Input</h3>

  <p>Select the week and day before entering data.</p>
  <select ref="week" onchange={setWeek}>
    <option value="">Select Week</option>
    <option value="week1">Week1</option>
    <option value="week2">Week2</option>
    <option value="week3">Week3</option>
    <option value="week4">Week4</option>
  </select>

  <select ref="dayOfWeek" onchange={ setDay }>
    <option value="">Select Day</option>
    <option value="m">Monday</option>
    <option value="t">Tuesday</option>
    <option value="w">Wednesday</option>
    <option value="r">Thursday</option>
    <option value="f">Friday</option>
  </select>
  
  <p>Enter today's Learn Unit Score</p>
  <input type="number" placeholder="Input Unit Score" ref="score">
  <button onclick={ setNumber }>Enter Unit Score</button>

  <p>Enter Comments</p>
  <input type="text" placeholder="Input comment" ref="comment">

  <button onclick={ setComment }>Enter comment</button>
  <br></br>
  
  
  <custom-tooltip tooltip-data={ tooltipData }></custom-tooltip>

  <script>
    var tag = this;
    console.log('app.tag');
    this.toolText = "This is my text.";
  //  this.tooltipData = {};
    this.day = 'm';

    setWeek(e) {
      tag.week = tag.refs.week.value;
    }

    setDay(e) {
      tag.day = tag.refs.dayOfWeek.value;
    }
    

    scoresRef.on('value', function (snap) {
      var data = snap.val();
      
      
      //var tooltips= [];
      
      var justtooltip = [];
      console.log(data);
      justtooltip[0] = data['week1']['m']['comment'];
      justtooltip[1] = data['week1']['t']['comment'];
      justtooltip[2] = data['week1']['w']['comment'];
      justtooltip[3] = data['week1']['r']['comment'];
      justtooltip[4] = data['week1']['f']['comment'];
      
      console.log(justtooltip);
          
          
      var justScores = [];
      console.log(data);
      justScores[0] = data['week1']['m']['score'];
      justScores[1] = data['week1']['t']['score'];
      justScores[2] = data['week1']['w']['score'];
      justScores[3] = data['week1']['r']['score'];
      justScores[4] = data['week1']['f']['score'];

  
      // data.map(function (obj) {   return obj.score; });
      var week2Scores = [];
      console.log(data);
      week2Scores[0] = data['week2']['m']['score'];
      week2Scores[1] = data['week2']['t']['score'];
      week2Scores[2] = data['week2']['w']['score'];
      week2Scores[3] = data['week2']['r']['score'];
      week2Scores[4] = data['week2']['f']['score'];

      var week3Scores = [];
      console.log(data);
      week3Scores[0] = data['week3']['m']['score'];
      week3Scores[1] = data['week3']['t']['score'];
      week3Scores[2] = data['week3']['w']['score'];
      week3Scores[3] = data['week3']['r']['score'];
      week3Scores[4] = data['week3']['f']['score'];

      var week4Scores = [];
      console.log(data);
      week4Scores[0] = data['week4']['m']['score'];
      week4Scores[1] = data['week4']['t']['score'];
      week4Scores[2] = data['week4']['w']['score'];
      week4Scores[3] = data['week4']['r']['score'];
      week4Scores[4] = data['week4']['f']['score'];

      tag.chart.data.datasets[0].data = justScores;
      tag.chart.data.datasets[1].data = week2Scores;
      tag.chart.data.datasets[2].data = week3Scores;
      tag.chart.data.datasets[3].data = week4Scores;

      tag.tooltipData= justtooltip[0];
      tag.chart.update();
      
      
    });

    setNumber(e) {

      var score = tag.refs.score.value;

      console.log(tag.chart.data.datasets);

      scoresRef.child(tag.week + '/' + tag.day + '/score').set(score);

    }
    setComment(e) {

      var comment = tag.refs.comment.value;

      console.log(tag.chart.data.datasets);

      scoresRef.child(tag.week + '/' + tag.day + '/comment').set(comment);

    }

    this.on('mount', function () {
      var ctx = this.refs.myChart.getContext('2d');
      this.chart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: [
            "M", "T", "W", "R", "F"
          ],
          datasets: [
            {
              label: 'Week1',
              // data: [10, 20, 30, 40, 50],
              lineTension: 0,
              backgroundColor: [
                'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)'
              ],
              borderColor: [
                'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)'
              ],
              borderWidth: 1
            }, {
              label: 'Week2',
              // data: [10, 20, 30, 40, 50],
              lineTension: 0,
              backgroundColor: [
                'rgba(100, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)'
              ],
              borderColor: [
                'rgba(100,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)'
              ],
              borderWidth: 1
            }, {
              label: 'Week3',
              // data: [10, 20, 30, 40, 50],
              lineTension: 0,
              backgroundColor: [
                'rgba(30, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)'
              ],
              borderColor: [
                'rgba(100,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)'
              ],
              borderWidth: 1
            }, {
              label: 'Week4',
              // data: [10, 20, 30, 40, 50],
              lineTension: 0,
              backgroundColor: [
                'rgba(30, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)'
              ],
              borderColor: [
                'rgba(100,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)'
              ],
              borderWidth: 1
            }

          ]
        },
        toolTip:{
          
          
        },
        options: {
          tooltips:{
            
            mode: 'nearest'
          }
          /* tooltips: {
            enabled: false,
            position: 'average',
            custom: function (tooltipModel) {
             //var tooltipEl = tag.refs.myTooltip.root;
          
              // Question is when is this "custom" function executing? console.log tells me this executes on every frame console.log('tooltip', tooltipEl); I want to update my tooltip (tag) on some condition... Probably when the thing my cursor is over changes So
              // I have to look into where that data is to be found. more console.log Turns out it has to do with callbacks, label... see below Second question is, what is 'this' in this function context? console.log(this); `this` will be the overall tooltip
              var position = this._chart.canvas.getBoundingClientRect();

              tooltipEl.style.opacity = 1;
              tooltipEl.style.position = 'absolute';
              tooltipEl.style.left = position.absolute + tooltipModel.caretX + 'px';
              tooltipEl.style.top = position.absolute + tooltipModel.caretY + 'px';

              // this.chart.data.datasets[0].data[this.day] = score; this.chart.data.labels[0] = 'MONDAY';
              //
              // this.chart.update();
            }

          } */

        }

      })

    });

    // Canvas element isn't available until after this tag is mounted. ChartJS requires the canvas element, so we use a lifecycle event.
  </script>

  <style>
    :scope {
      display: block;
    }
    [ref="x"] {
      background-color: dodgerblue;
      width: 50px;
    }
  </style>
</app>
