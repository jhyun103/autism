<app>

  <h1>Student Progress Tracker</h1>
  <p>Weekly Learn Unit Scores</p>
  <canvas ref="myChart" width="100%"></canvas>

  <input type="number" ref="score">
	<select ref="dayOfWeek" onchange={ setDay }>
		<option value="m">Monday</option>
		<option value="t">Tuesday</option>
    <option value="w">Wednesday</option>
    <option value="r">Thursday</option>
    <option value="f">Friday</option>
	</select>
	<button onclick={ setNumber }>Enter Number</button>

	<custom-tooltip ref="myTooltip" tooltip-data={ tooltipData } x={"Jin"}></custom-tooltip>

  <script>
    var tag = this;
    console.log('app.tag');
    this.toolText = "This is my text.";
    this.tooltipData = {};
    this.day = 'm';

    setDay(e) {
    this.day = this.refs.dayOfWeek.value;
  }


		scoresRef.on('value', function(snap){
		  console.log(snap.val());
			var data = Object.values(snap.val());

			var justScores = data.map(function(obj){
			  return obj.score;
			});
			console.log(data);
			console.log(justScores);

			tag.chart.data.datasets[0].data[0] = justScores[0];
			tag.chart.data.datasets[0].data[1] = justScores[1];
      tag.chart.data.datasets[0].data[2] = justScores[2];
      tag.chart.data.datasets[0].data[3] = justScores[3];
      tag.chart.data.datasets[0].data[4] = justScores[4];

			tag.chart.update();
		});

    setNumber(e) {
  var score = this.refs.score.value;

  console.log(this.chart.data.datasets);

  scoresRef.child(this.day + '/score').set(score);

  // this.chart.data.datasets[0].data[this.day] = score;
  // this.chart.data.labels[0] = 'MONDAY';
  //
  // this.chart.update();
}


this.on('mount', function(){
  var ctx = this.refs.myChart.getContext('2d');
  this.chart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ["M", "T", "W", "R", "F"],
        datasets: [{
            label: 'Current Week',
            data: this.justScores,
            lineTension: 0,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
      tooltips: {
        enabled: false,
        position: 'average',
        custom: function(tooltipModel){
          var tooltipEl = tag.refs.myTooltip.root;

          // Question is when is this "custom" function executing?
          // console.log tells me this executes on every frame
          // console.log('tooltip', tooltipEl);

          // I want to update my tooltip (tag) on some condition...
          // Probably when the thing my cursor is over changes
          // So I have to look into where that data is to be found. more console.log
          // Turns out it has to do with callbacks, label... see below


          // Second question is, what is 'this' in this function context?
          // console.log(this);

          // `this` will be the overall tooltip
          var position = this._chart.canvas.getBoundingClientRect();

          tooltipEl.style.opacity = 1;
          tooltipEl.style.position = 'absolute';
          tooltipEl.style.left = position.left + tooltipModel.caretX + 'px';
          tooltipEl.style.top = position.top + tooltipModel.caretY + 'px';


        },
        callbacks: {
          // This seems to be the callback that is called when the mouse is hovering
          // over a tooltip trigger area
          // Note this is triggered on any mouse movement in the trigger area
          // So it's fine for little dynamic things (like click stuff in the tooltip)... but if your tooltip riot tag is going to do something like a firebase query -... it's going to fire off a query many many times. So you need some control to only query if for example, the value has changed. etc.
          label: function(tooltipItem, data) {
            console.log('TOOLTIPITEM:', tooltipItem);
            console.log('DATA:', data)
            tag.tooltipData = tooltipItem;
            tag.update();
          }
        }
      }
    }
});

});


    // Canvas element isn't available until after this tag is mounted. ChartJS requires the canvas element, so we use a lifecycle event.
/*
    var lineChartData = {
      labels: [
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"
      ],
      datasets: [
        {
          label: 'accuracy',
          lineTension: 0,
          pointRadius: 5,
          data: [
            12,
            19,
            3,
            5,
            2,
            3
          ],

          yAxisID: 'y-axis-1',
          backgroundColor: ['rgba(255, 99, 132, 0.2)'],

          borderColor: ['rgba(255,99,132,1)'],
          borderWidth: 1
        }, {
          label: 'accuracy',
          lineTension: 0,
          pointRadius: 5,
          data: [
            100, 20, 50, 60, 50
          ],
          yAxisID: 'y-axis-2',
          backgroundColor: ['rgba(255, 159, 64, 0.2)'],
          borderColor: ['rgba(255, 206, 86, 1)'],
          borderWidth: 1
        }
      ]
    };

    this.on('mount', function () {

      console.log('mount');

      var ctx = this.refs.myChart.getContext('2d');
      var myChart = new Chart(ctx, {
        type:'line',

        data: lineChartData,
        options: {
          responsive: true,
          hoverMode: 'index',
          stacked: false,
          title: {
            display: true,
            text: 'Chart.js Line Chart - Multi Axis'
          },
          scales: {
            yAxes: [
              {
                type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                display: true,
                position: 'left',
                id: 'y-axis-1'
              }, {
                type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                display: true,
                position: 'right',
                id: 'y-axis-2',
                // grid line settings
                gridLines: {
                  drawOnChartArea: false, // only want the grid lines for one axis to show up
                }
              }
            ]
          }
        }

      });

      this.on('updated', function () {
        console.log('updated');
      });
    });
    */

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
