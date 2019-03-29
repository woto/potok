<template>
  <div>
    <rate-chart
      :v-if="isRatesLoaded"
      :style="chartStyles"
      :chart-data="chartData"
      :options='{responsive: true, maintainAspectRatio: false, elements: { line: { tension: 0 } }}'>
    </rate-chart>

    <div class="container">
      <div class="row">
        <div class="col-sm-4">
          <rate-calendar
            mode='range'
            v-model='dateRange'>
            <input
              slot-scope='props'
              :value='props.inputValue'
              type='text'
              class="form-control">
            </input>
          </rate-calendar>
        </div>
        <div class="col-sm">
          <button class="btn btn-success" @click="fillData()">Обновить</button>
        </div>
      </div>
    </div>

  </div>
</template>

<script>

  import Vue from 'vue';
  import Axios from 'axios'

  export default {
    components: {
      'rate-chart': () => import(/* webpackChunkName: "rate-chart" */ './RateChart'),
      'rate-calendar':  () => import(/* webpackChunkName: "rate-calendar" */ './RateCalendar')
    },
    data () {
      return {
        chartData: {},
        isRatesLoaded: false,
        dateRange: {
          // oh oh oh
          start: new Date(new Date().setDate(new Date().getDate()-15)),
          end: new Date()
        },
      }
    },
    computed: {
      chartStyles () {
        return {
          height: '400px',
          position: 'relative'
        }
      }
    },
    methods: {
      async fillData () {
        try {
          const json = await Axios.get('/ajax/rates.json', {
            params: {
              from: this.dateRange.start,
              to: this.dateRange.end
            }
          })
          this.chartData = json.data
          this.isRatesLoaded = true
        } catch (e) {
          alert(JSON.stringify(e.response.data));
        }
      }
    },
    async created() {
      await this.fillData()
    },
  }
</script>
